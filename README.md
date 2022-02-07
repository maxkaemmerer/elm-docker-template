# Elm Docker Template

## Introduction
This is a small template that sets you up with a local dev environment using Elm in Docker behind a Caddy webserver.
**(Tested with Ubuntu 20.04)** 

## Requirements
* Port 80 must be available
* [yarn](https://yarnpkg.com/) must be installed (tested with node 16 and yarn 1.22.17)

## Setup
1. Run `git clone https://github.com/maxkaemmerer/elm-docker-template.git my-elm-app` (Replace my-elm-app with whatever name you want)
2. Remain on branch `main` if you want the template with routing and swap to `simple` for a, who would have thought, simpler version without routing by running `git switch simple`.
3. Remove the `.git` directory and init a new git repository like so `cd my-elm-app && rm -rf .git && git init`
4. Add `127.0.0.1 elm-app.dynamic` and `127.0.0.1 elm-app.static` to your /etc/hosts. You can of course change the host, just make sure to change it in the following files.
    * [.docker/caddy/static.Caddyfile](.docker/caddy/static.Caddyfile) 
    * [.docker/caddy/Caddyfile](.docker/caddy/Caddyfile)  
    * [end2end/docker-compose.yml](end2end/docker-compose.yml)
    * [end2end/cypress.json](end2end/cypress.json)
5. execute `make up`
6. visit [http://elm-app.dynamic](http://elm-app.dynamic) for the hot-reloaded site, or [http://elm-app.static](http://elm-app.static) for the version last built with `make build`
7. Get to work at [frontend/src/Main.elm](frontend/src/Main.elm)!

## Editor Plugins
Your editor plugin might require that elm, elm-test and elm-format are installed globally. Run `make install-editor-deps` to install them globally.
### Visual Studio Code
https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode

### IntelliJ 
https://plugins.jetbrains.com/plugin/10268-elm

## E2E Note
The e2e environment only works with the statically built version of the app (`make build`), so you'll have to rebuild the app when you are working on fixing and adding tests. This is on purpose since I want to ensure that we run these tests against an environment as close to production as possible, so without hot reloading and debugging etc.

## Make commands
### `make install-editor-deps`
Installs global dependencies that might be needed by Elm editor plugins.(You should only need to do this once and only if your editor/plugin can't resolve elm, elm-format or elm-test).

### `make install`
Installs all local dependencies for the Elm and e2e app.

### `make build`
Builds the elm application so it can be deployed to somewhere or tested locally via for example the e2e Tests.

### `make up`
Install, builds and starts the docker environment. This should be your go to when you start working.

### `make down`
Shuts down the docker environment

### `make validate-format`
Execute elm-format without fixing the files. This throws an error if your Elm code is not properly formatted. I use this in my CI environment.

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

## Credit
* The image used is https://unsplash.com/photos/4hbJ-eymZ1o by [Florian Olivo](https://unsplash.com/@florianolv).
* The Elm project is bootstrapped with [create-elm-app](https://github.com/halfzebra/create-elm-app) and was then ejected and moved over to [Parcel](https://parceljs.org/).
* The migration from create-elm-app to Parcel was done by following [this](https://medium.com/@FlavioCorpa/migrating-from-create-elm-app-to-parcel-2-0-71e5f2fd0e3) guide by [Flavio Corpa](https://medium.com/@FlavioCorpa)