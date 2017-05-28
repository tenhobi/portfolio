var gulp = require('gulp');
var sass = require('gulp-sass');
var autoprefixer = require('gulp-autoprefixer');
var rename = require('gulp-rename');

var config = {
    scripts: ['./src/assets/scripts/**/*.js'],
    styles: ['./src/assets/styles/**/*.scss'],
    output: './src/build'
};

// Generate CSS from Sass.
gulp.task('sass', function () {
    return gulp.src(config.styles)
            .pipe(sass({outputStyle: 'expanded'}))
            .pipe(autoprefixer())
            .pipe(rename('style.css'))
        .pipe(gulp.dest(config.output));
});

// Task for run watch on 'sass' task.
gulp.task('watch:sass', ['sass'], function () {
    gulp.watch(config.styles, ['sass']);
});

// Task to run in Travis CI.
gulp.task('travis', ['sass']);

// Default task.
gulp.task('default', ['sass']);
