Appengine SDK for Go as a docker container

Quick and dirty work around for broken macOS sierra environment.

1. Install docker
1. `docker build . -t appengine`
1. `docker run --rm -v $(pwd):/app -p 8000:8000 -p 8080:8080 -ti appengine`
1. `open http://localhost:8000`
