gulp = require("gulp")

# Compile .jade files to .html files
jade = require("gulp-jade")
gulp.task("jade", ->
  gulp.src("src/jade/**/[^_]*.jade")
    .pipe(
      jade(
        pretty: true
      )
    )
    .pipe(gulp.dest("web/"))
)

# Compile .scss files to .css files
sass = require("gulp-sass")
gulp.task("sass", ->
  gulp.src("src/sass/**/[^_]*.scss")
    .pipe(
      sass(
        outputStyle: "nested"
        sassDir: "src/sass/"
        cssDir: "web/css/"
        sourcemap: true
      )
    )
    .pipe(gulp.dest("web/css/"))
)

# Compile .coffee files to .js files
coffee = require("gulp-coffee")
gulp.task("coffee", ->
  gulp.src("src/coffee/**/*.coffee")
    .pipe(
      coffee(
        bare: true
      )
    )
    .pipe(gulp.dest("web/js/"))
)
# Copy require.js to web/js/vendor
gulp.task("copy:requirejs", ->
  gulp.src("node_modules/requirejs/require.js")
    .pipe(gulp.dest("web/js/vendor"))
)
# Build RequireJS
rjs = require("gulp-requirejs")
build = require("./build.json")
gulp.task("requirejs", ["coffee", "copy:requirejs"], ->
  rjs(build)
    .pipe(gulp.dest("web/js/"))
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
  gulp.watch("src/jade/**/*.jade", ["jade"])
  gulp.watch("src/sass/**/*.scss", ["sass"])
  gulp.watch("src/coffee/**/*.coffee", ["requirejs"])
  gulp.watch("build.json", ["requirejs"])
  gulp.watch("src/fonts/**/*", ["copy:fonts"])
  gulp.watch("src/images/**/*", ["copy:images"])
)

gulp.task("build", [
  "jade",
  "sass",
  "requirejs",
  "copy:fonts",
  "copy:images"
])
gulp.task("default", ["build", "watch"])
