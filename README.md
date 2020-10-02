# docker-lektor

Docker container for running [Lektor CMS](https://www.getlektor.com), plus some useful Javascript tools.

We mainly use this in continuous integration & delivery pipelines.

Docker builds: https://hub.docker.com/r/ikus060/lektor/

 `docker pull ikus060/lektor`
 
## Base image

`python:3`

## Installed packages

 * rsync
 * Lektor 3.x
 * Nodejs 10.x
 * lessc
 * Java

# Usage

**For development**
You may use this lektor docker image to develop your website locally.

    docker run -it -v `pwd`:/lektor -p 5000:5000 ikus060/lektor server

**FOR Gitlab CICD**

    image: ikus060/lektor:3.1.3
    
    stages:
    - build
    
    build:
      stage: build
      script:
      # Build website
      - lektor build -O _site
      # Upload
      - eval $(ssh-agent -s)
      - echo "$WWWDATA_PRIVATEKEY" | tr -d '\r' | ssh-add - > /dev/null
      - export RSYNC_RSH="ssh -o StrictHostKeyChecking=no"
      - rsync -avz ./_site/. www-data@example.com:/var/www/
