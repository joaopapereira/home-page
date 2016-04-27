var gulp = require('gulp');
var path = require('path');
var sourcemaps = require('gulp-sourcemaps');
var ts = require('gulp-typescript');
var del = require('del');
var concat = require('gulp-concat')
var runSequence = require('run-sequence');
var scss = require('gulp-scss');
var minifyCss = require('gulp-minify-css');

// SERVER
gulp.task('clean', function(){
    return del('dist')
});

gulp.task('build:server', function () {
	var tsProject = ts.createProject('server/tsconfig.json');
    var tsResult = gulp.src('server/**/*.ts')
		.pipe(sourcemaps.init())
        .pipe(ts(tsProject))
	return tsResult.js
        .pipe(concat('server.js'))
        .pipe(sourcemaps.write())
		.pipe(gulp.dest('dist'))
});


// CLIENT

/*
  jsNPMDependencies, sometimes order matters here! so becareful!
*/
var jsNPMDependencies = [
    'angular2/bundles/angular2-polyfills.js',
    'systemjs/dist/system.src.js',
    'rxjs/bundles/Rx.js',
    'angular2/bundles/angular2.dev.js',
    'angular2/bundles/router.dev.js',
    'ng2-bootstrap/bundles/ng2-bootstrap.js',
    ''
]

gulp.task('build:assets', function(){
    var mappedPaths = jsNPMDependencies.map(file => {return path.resolve('node_modules', file)})

    //Let's copy our head dependencies into a dist/libs
    var copyJsNPMDependencies = gulp.src(mappedPaths, {base:'node_modules'})
        .pipe(gulp.dest('dist/libs'))

    var copyIndex = gulp.src(['client/app/**/*',
                              'client/index.html',
                              'client/**/*.css',
                              '!client/app/**/*.ts',
                              'client/images/**'], { base : './client/' })
    .pipe(gulp.dest('dist'))
    return [copyJsNPMDependencies, copyIndex];
});

gulp.task('build:scss', function () {
  var appScss = ['**/*.scss', '!node_modules/**/*.*']
  gulp.src(appScss)
    .pipe(scss(
            {"bundleExec": true}
        ))
    //.pipe(minifyCss({compatibility: 'ie8'})) // see the gulp-scss doc for more information on compatibilitymodes
        .pipe(gulp.dest(function(file) {
            return file.base; // because of Angular 2's encapsulation, it's natural to save the css where the scss-file was
    }));
});

gulp.task('build:app', function(){
    var tsProject = ts.createProject('client/tsconfig.json');
    var tsResult = gulp.src('client/**/*.ts')
		.pipe(sourcemaps.init())
        .pipe(ts(tsProject))
	return tsResult.js
        .pipe(sourcemaps.write())
		.pipe(gulp.dest('dist'))
});

gulp.task('tslint', function() {
  return gulp.src('client/app/**/*.ts')
    .pipe(tslint())
    .pipe(tslint.report('verbose'));
});


gulp.task('build', function(callback){
    runSequence('clean', 'build:server', 'build:scss', 'build:assets', 'build:app', callback);
});

gulp.task('watch', ['build:app', 'build:scss'],function(){ // brackets makes sure we run ts and scss once before the watch starts
    gulp.watch('client/app/**/*.ts', ['build:app']); // run the ts-task any time stuff in appJavascript changes
    gulp.watch('client/app/**/*.scss', ['build:scss', 'build:assets']); // run the scss-task any time stuff in the appScss changes
    gulp.watch('client/**/*.html', ['build:assets']); // run the scss-task any time stuff in the appScss changes
});

gulp.task('default', ['build']);
