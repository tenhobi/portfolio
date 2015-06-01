var gulp = require('gulp'),
    sass = require('gulp-sass'),
    autoprefixer = require('gulp-autoprefixer'),
    rename = require('gulp-rename'),
    notify = require('gulp-notify'),
    sourcemaps = require('gulp-sourcemaps');

var source = './src/';

var input = {
    sass: source + 'sass/**/*.scss'
};

var output = {
    sass: source + './css/',
    maps: 'maps/'
};

// Generate CSS from Sass.
gulp.task('sass', function () {
    return gulp.src(input.sass)
        .pipe(sourcemaps.init())
            .pipe(sass({outputStyle: 'expanded'}))
                .on('error', notify.onError({
                    title: "Error: Compile Sass",
                    message: "<%= error.message %>"
                }))
            .pipe(autoprefixer())
            .pipe(rename('style.css'))
        .pipe(sourcemaps.write(output.maps))
        .pipe(gulp.dest(output.sass));
});

// Task for run watch on 'sass' task.
gulp.task('watch:sass', ['sass'], function () {
    gulp.watch(input.sass, ['sass']);
});

// Task to run in Travis CI.
gulp.task('travis', ['sass']);

// Default task.
gulp.task('default');
