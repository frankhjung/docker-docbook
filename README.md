# docker-docbook

The following lists some basic commands to build Docker image used to render
[DocBook](https://docbook.org/) into HTML.

The latest Docker image can be found on [Docker Hub](https://cloud.docker.com),
[here](https://cloud.docker.com/repository/docker/frankhjung/docbook/general).

## Login

```bash
echo [token] | docker login -u frankhjung --password-stdin
```

## Build

```bash
docker build --compress --rm --tag frankhjung/docbook:latest .
```

## Run

Run image with:

```bash
docker run frankhjung/docbook:latest
```

The default call to this container returns the current version of the
[jw](https://manpages.debian.org/testing/docbook-utils/jw.1.en.html) script:

```
$ docker run -t -i -u $(id -u):$(id -g) frankhjung/docbook:latest
Unable to find image 'frankhjung/docbook:latest' locally
latest: Pulling from frankhjung/docbook
eafd24d25890: Already exists
cf2a8976c989: Already exists
Digest: sha256:622ad885ed60dc02c29fb01cfcbe15aec432125d8db1b77baf49ea6e13000472
Status: Downloaded newer image for frankhjung/docbook:latest
DocBook-utils version 0.6.14 (jw version 1.1)
```

## Tag

Use version from run to set the image tag:

```bash
export VERSION=0.6.14
```

```bash
docker tag frankhjung/docbook:latest frankhjung/docbook:${VERSION}
```

Verify with:

```bash
docker image inspect --format='{{json .Config.Labels}}' frankhjung/docbook:latest
```

## Usage

To render [DocBook](https://docbook.org/) as a PDF document:

```bash
docker run \
  --rm -t \
  -v $PWD:/opt/workspace \
  -u $(id -u):$(id -g) \
  frankhjung/docbook:latest \
  jw -f docbook -b pdf -o public index.sgml
```

This will read from current directory and place the rendered PDF in the `public`
directory.

## References

* [Docbook](https://docbook.org/)
* [Docker Commandline](https://docs.docker.com/engine/reference/commandline/docker/)
* [Dockerfile](https://docs.docker.com/glossary/?term=Dockerfile)
* [Published to GitLab as FAQ](https://gitlab.com/frankhjung1/faq)
