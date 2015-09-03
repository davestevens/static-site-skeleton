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

## Deploying

### Github Pages

```shell
bash deploy.sh
```
Builds all files and pushes to `gh-pages` branch.

## Export
`npm run export`

Produces a zip file of `web` directory.

## Notes

### HTML
Files from `src/jade` are compiled into the `web` directory.
Any files with names beginning with and underscore are ignored, this is used for partials and so are not included directly in output.

### CSS
Files from `src/sass` are compiled into the `web/css` directory.
Any files with names beginning with and underscore are ignored, this is used for partials and so are not included directly in output.

### JS
Files from `src/coffee` are compiled into the `web/js` directory.
I am using [Browserify](http://browserify.org/) and [Coffeeify](https://github.com/jnordberg/coffeeify) for dependency management.

### Fonts
Files and directories in `src/fonts` are copied into the `web/fonts` directory.

### Images
Files and directories in `src/images` are copied into the `web/images` directory.

## TODO

- [x] ~~Use RequireJS for JS dependency management~~
- [x] ~~Use r.js~~
- [x] Investigate different ways of JS dependency management?
- [x] Production/Development builds
- [x] Exporting
- [ ] Deploying
