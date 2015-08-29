# Static Site Skeleton

A simple skeleton for creating static sites, currently uses [Jade](http://jade-lang.com/), [Sass](http://sass-lang.com/) & [CoffeeScript](http://coffeescript.org/).

Builds files into `web/` directory using [Gulp](http://gulpjs.com/).

## Building

Tasks have been created in the `package.json` file, run `npm install` to install all required packages.

### Running a local server

`npm run start`
Starts a local server which runs out of the `web` directory

### Compilation
`npm run build`
Compiles all files into `web` directory.

`npm run watch`
Compiles all files into `web` directory and watches for any changes.

## Notes

### HTML
Files from `src/jade` are compiled into the `web` directory.
Any files with names beginning with and underscore are ignored, this is used for partials and so are not included directly in output.

### CSS
Files from `src/sass` are compiled into the `web/css` directory.
Any files with names beginning with and underscore are ignored, this is used for partials and so are not included directly in output.

### JS
Files from `src/coffee` are compiled into the `web/js` directory.
I am using [RequireJS](http://requirejs.org/) for dependency management, this creates a single `app.js` file which contains the full JavaScript code (including vendor files). The `requirejs` task in the gulpfile compiles all CoffeeScript code, runs r.js and copies require.js to `web/js/vendor`.

### Fonts
Files and directories in `src/fonts` are copied into the `web/fonts` directory.

### Images
Files and directories in `src/images` are copied into the `web/images` directory.

## TODO

- [x] Use RequireJS for JS dependency management
- [x] Use r.js
- [ ] Investigate different ways of JS dependency management?
- [ ] Production/Development builds
- [ ] Exporting
- [ ] Deploying
