/*
 * slush-slush-cmake
 * https://github.com/julian-becker/slush-slush-cmake
 *
 * Copyright (c) 2018, Julian Becker
 * Licensed under the MIT license.
 */

'use strict';

var gulp = require('gulp'),
    install = require('gulp-install'),
    conflict = require('gulp-conflict'),
    replace = require('gulp-replace'),
    template = require('gulp-template'),
    rename = require('gulp-rename'),
    _ = require('underscore.string'),
    inquirer = require('inquirer'),
    path = require('path');

function format(string) {
    var username = string.toLowerCase();
    return username.replace(/\s/g, '');
}

var defaults = (function () {
    var workingDirName = path.basename(process.cwd()),
      homeDir, osUserName, configFile, user;

    if (process.platform === 'win32') {
        homeDir = process.env.USERPROFILE;
        osUserName = process.env.USERNAME || path.basename(homeDir).toLowerCase();
    }
    else {
        homeDir = process.env.HOME || process.env.HOMEPATH;
        osUserName = homeDir && homeDir.split('/').pop() || 'root';
    }

    configFile = path.join(homeDir, '.gitconfig');
    user = {};

    if (require('fs').existsSync(configFile)) {
        user = require('iniparser').parseSync(configFile).user;
    }

    return {
        appName: workingDirName,
        libraryName1: 'mylibA',
        libraryName2: 'mylibB',
        authorName: user.name || '',
        authorEmail: user.email || ''
    };
})();

gulp.task('default', function (done) {
    var prompts = [{
        name: 'appName',
        message: 'Name for the main application?',
        default: defaults.appName
    }, {
        name: 'appDescription',
        message: 'What is the description for this application?'
    }, {
        name: 'libraryName1',
        message: 'Name of dummy component library 1?',
        default: defaults.libraryName1
    }, {
        name: 'libraryName2',
        message: 'Name of dummy component library 2?',
        default: defaults.libraryName2
    }, {
        name: 'appVersion',
        message: 'What is the version of your project?',
        default: '0.1.0'
    }, {
        name: 'authorName',
        message: 'What is the author name?',
        default: defaults.authorName
    }, {
        name: 'authorEmail',
        message: 'What is the author email?',
        default: defaults.authorEmail
    }, {
        type: 'list',
        name: 'license',
        message: 'Choose your license type',
        choices: ['MIT', 'BSD', 'UNLICENSE'],
        default: 'UNLICENSE'
    }, {
        type: 'list',
        name: 'testingFramework',
        message: 'Choose your testing framework',
        choices: ['GoogleTest', 'Catch2'],
        default: 'Catch2'
    }, {
        type: 'confirm',
        name: 'moveon',
        message: 'Continue?'
    }];
    //Ask
    inquirer
        .prompt(prompts)
        .then(function (answers) {
            if (!answers.moveon) {
                return done();
            }

            var d = new Date();
            answers.year = d.getFullYear();
            answers.date = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
            answers.LIBRARYNAME1 = answers.libraryName1.toUpperCase();
            answers.LIBRARYNAME2 = answers.libraryName2.toUpperCase();
            answers.appNameSlug = _.slugify(answers.appName);

            var files = [
                __dirname + '/templates/**',
                __dirname + '/templates_' + answers.testingFramework + '/**'
            ];

            gulp.src(files)
                .pipe(replace('${','_UGLY_OPENBRACE_'))
                .pipe(replace('}','_UGLY_CLOSINGBRACE_'))
                .pipe(template(answers))
                .pipe(replace('_UGLY_OPENBRACE_','${'))
                .pipe(replace('_UGLY_CLOSINGBRACE_','}'))
                .pipe(rename(function (path) {
                    if (path.basename[0] === '_') {
                        path.basename = '.' + path.basename.slice(1);
                    }
                    path.dirname  = path.dirname
                      .replace(/==(\s*appName\s*)==/g, answers.appName)
                      .replace(/==(\s*libraryName1\s*)==/g, answers.libraryName1)
                      .replace(/==(\s*libraryName2\s*)==/g, answers.libraryName2);
                    path.basename = path.basename
                      .replace(/==(\s*appName\s*)==/g, answers.appName)
                      .replace(/==(\s*libraryName1\s*)==/g, answers.libraryName1)
                      .replace(/==(\s*libraryName2\s*)==/g, answers.libraryName2);
                }))
                .pipe(conflict('./'))
                .pipe(gulp.dest('./'))
                .pipe(install())
                .on('end', function () {
                    done();
                });

            gulp.src(__dirname + '/license_templates/LICENSE_'+answers.license)
                .pipe(template(answers))
                .pipe(rename(function (path) {
                    console.log('basename='+path.basename);
                    path.basename = 'LICENSE';
                }))
                .pipe(conflict('./'))
                .pipe(gulp.dest('./'))
                .pipe(install())
                .on('end', function () {
                    done();
                });
        });
});
