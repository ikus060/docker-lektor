# docker-lektor

Docker container for running [Lektor CMS](https://www.getlektor.com), plus some useful Javascript tools.

We mainly use this in continuous integration & delivery pipelines.

Docker builds: https://hub.docker.com/r/ikus060/lektor/

 `docker pull ikus060/lektor`
 
## Base image

`python:3`

## Installed packages

 * Lektor 3.x
 * Nodejs 10.x with npm
 * lessc
 * default Java
