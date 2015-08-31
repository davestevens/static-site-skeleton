gulp = require("gulp")
gutil = require("gulp-util")

log_error = (error) ->
  gutil.log(gutil.colors.red(error.toString()))
  @emit("end")

# Compile .jade files to .html files
jade = require("gulp-jade")
gulp.task("html", ->
  gulp.src("src/jade/**/[^_]*.jade")
    .pipe(
      jade(
        pretty: true
      ).on("error", log_error)
    )
    .pipe(gulp.dest("web/"))
)

# Compile .scss files to .css files
sass = require("gulp-sass")
gulp.task("styles", ->
  gulp.src("src/sass/**/[^_]*.scss")
    .pipe(
      sass(
        outputStyle: "nested"
        sassDir: "src/sass/"
        cssDir: "web/css/"
        sourcemap: true
      ).on("error", log_error)
    )
    .pipe(gulp.dest("web/css/"))
)

# Compile .coffee files to .js files
coffeeify = require("gulp-coffeeify")
gulp.task("scripts", ->
  gulp.src("src/coffee/**/*.coffee")
    .pipe(
      coffeeify()
        .on("error", log_error)
    )
    .pipe(gulp.dest("web/js"))
)

# Copy any font files
gulp.task("copy:fonts", ->
  gulp.src("src/fonts/**/*")
    .pipe(gulp.dest("web/fonts/"))
)
# Copy any image files
gulp.task("copy:images", ->
  gulp.src("src/images/**/*")
    .pipe(gulp.dest("web/images/"))
)

gulp.task("watch", ->
  gulp.watch("src/jade/**/*.jade", ["html"])
  gulp.watch("src/sass/**/*.scss", ["styles"])
  gulp.watch("src/coffee/**/*.coffee", ["scripts"])
  gulp.watch("src/fonts/**/*", ["copy:fonts"])
  gulp.watch("src/images/**/*", ["copy:images"])
)

gulp.task("build", [
  "html",
  "styles",
  "scripts",
  "copy:fonts",
  "copy:images"
])
gulp.task("default", ["build", "watch"])
