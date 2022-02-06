# Elm Docker Template

## Introduction
This is a small template that sets you up with a local dev environment using Elm in Docker behind a Caddy webserver. The Elm project is bootstrapped with [Create Elm App](https://github.com/halfzebra/create-elm-app).

## Setup
1. Run `git clone git@github.com:maxkaemmerer/elm-docker-template.git my-elm-app` (Replace my-elm-app with whatever name you want)
2. Remain on branch `main` if you want the template with routing and swap to `simple` for a, who would have thought, simpler version without routing by running `git switch simple`.
3. Remove the `.git` directory and init a new git repository like so `cd my-elm-app && rm -rf .git && git init`
4. Add `127.0.0.1 elm-app.dynamic` and `127.0.0.1 elm-app.static` to your /etc/hosts. You can of course change the host, just make sure to change it in the following files.
    * `.docker/caddy/static.Caddyfile` 
    * `.docker/caddy/Caddyfile`  
    * `end2end/docker-compose.yml`
    * `end2end/cypress.json`
5. execute `make up`
6. visit `http://elm-app.dynamic` for the hot-reloaded site, or `http://elm-app.static` for the version last built with `make build`

## E2E Note
The e2e environment only works with the statically built version of the app (`make build`), so you'll have to rebuild the app when you are working on fixing and adding tests. This is on purpose since I want to ensure that we run these tests against an environment as close to production as possible, so without hot reloading and debugging etc.

## Make commands
### `make install`
Installs all dependencies

### `make build`
Builds the elm application so it can be deployed to somewhere or tested locally via for example the e2e Tests

### `make up`
Install, builds and starts the docker environment. This should be your go to when you start working.

### `make down`
Shuts down the docker environment

### `make validate-format`
Execute elm-format without fixing the files. This throws an error if your Elm code is not properly formatted. I use this in my CI environment

### `make format`
Execute elm-format, formatting your Elm code.

### `make test`
Executes your Elm tests.

### `make prepare-e2e`
Starts up your e2e test environment. You should use `make e2e-up` however, since that script also upadates your dependencies.

### `make check`
Executes your e2e and units tests and formats your Elm code.

### `make e2e`
Executes your e2e tests for both chrome and firefox. You should have run `make e2e-up` first.

### `make e2e-up`
Installs all dependencies and start your e2e test environment. (Combines `make install`, `make build` and `make prepare-e2e`)

### `make e2e-down`
Shut down your e2e test environment.

### `make e2e-open`
Opens the Cypress UI to view and run tests manually. You should have run `make e2e-up` first.

## Elm Resources

### Official
* [Official Guide](https://guide.elm-lang.org/)
* [Packages](https://package.elm-lang.org/)

### Learning
* [Elm in Action](https://livebook.manning.com/book/elm-in-action) Book by Richard Feldman
* [Introduction to Elm](https://frontendmasters.com/courses/intro-elm/) Course by Richard Feldman 
* [Advanced Elm](https://frontendmasters.com/courses/advanced-elm/) Course by Richard Feldman 

## Talks
* [The Life of A File](https://www.youtube.com/watch?v=XpDsk374LDE) by Evan Czaplicki
* [Making Impossible States Impossible](https://www.youtube.com/watch?v=IcgmSRJHu_8) by Richard Feldman
* [Scaling Elm Apps](https://www.youtube.com/watch?v=DoA4Txr4GUs) by Richard Feldman
* [Accessibility with Elm](https://www.youtube.com/watch?v=G_TNRuoF3FE) by Tessa Kelly
* [Solving the Boolean Identity Crisis](https://www.youtube.com/watch?v=6TDKHGtAxeg) by Jeremy Fairbank
* [elm-conf Talks](https://www.youtube.com/c/elmconf/videos?view=0&sort=p&flow=grid)
* [Elm Europe Talks](https://www.youtube.com/c/ElmEurope/videos?view=0&sort=p&flow=grid)

### Misc
* [Elm Accessible Package](https://package.elm-lang.org/packages/tesk9/accessible-html/latest/) by Tessa Kelly