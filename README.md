# Docker Microservices
A base image for a set of node-based Microservices

## `ONBUILD` Command
The base image sets up a common pattern for bundling a Node app within an image, excluding unnecessary NPM cache data, and installing common `-global` NPM modules.

The `ONBUILD` command copies the node app into the image consistently, so dervied Dockerfile's for each service can be as short as:


```docker
FROM philcockfield/base
EXPOSE 4040
```


#### Building
To build the image run from the project root:

```bash
cd base
sh ./base.sh
```

#### Secret
The image contains one secret, the NPM authorization token required to access private modules.  This pattern for accessing NPM's private modules within a Dockerfile was described here:

- [docker-build-private-npm-private-docker-hub](http://stackoverflow.com/questions/30573501/docker-build-private-npm-private-docker-hub)

Ensure that the following environment variable is setup within your profile:

```bash
export NPM_TOKEN=<value>
```

The token must be generated from a user-account on NPM that has access to the private modules being referenced by the packaged node app.  To get the NPM token login to NPM at the command line, then open the file at:

```bash
~/.npmrc
```


For more information see [Deploying with npm private modules](http://blog.npmjs.org/post/118393368555/deploying-with-npm-private-modules).
