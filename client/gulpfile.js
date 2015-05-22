var gulp = require('gulp');
var babel = require('gulp-babel');
var browserify = require('browserify');
var source = require('vinyl-source-stream');

gulp.task('default', ['babel', 'browserify']);

gulp.task('babel', function() {
  gulp.src('src/**/*.js')
    .pipe(babel())
    .pipe(gulp.dest('lib'));
});

gulp.task('browserify', function() {
  browserify({
    entries: ['./lib/index.js'],
    extentions: ['.js']
  })
  .bundle()
  .pipe(source('app.js'))
  .pipe(gulp.dest('../priv/static/js'))
});
