var gulp = require('gulp'),
    sass = require('gulp-sass'),
    autoprefixer = require('gulp-autoprefixer'),
    rename = require('gulp-rename');

var Options = function(){
    this.sass = {
      files: 'src/sass/**/*.scss',
      dir: 'src/css/'
    };
};
var opt = new Options();

// Files to read.
var paths = {
    sass: 'src/sass/**/*.scss'
};

// Folders for export.
var dirs = {
    css: 'src/css/'
};

// Compile Sass, autoprefix properties, generate CSS.
gulp.task('sass', function () {
    return gulp.src(paths.sass)
        .pipe(sass({outputStyle: 'compressed'}))
        .pipe(autoprefixer())
        .pipe(rename('style.css'))
        .pipe(gulp.dest(dirs.css));
});

// Watch ['Sass'] change in files and run it at begin.
gulp.task('watch', ['sass'], function () {
    gulp.watch('./sass/**/*.scss', ['sass']);
});

// On default call watch.
gulp.task('default', ['sass']);
