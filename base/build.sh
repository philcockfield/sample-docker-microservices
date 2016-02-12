#!/bin/bash
# ------------------------------------------------------------------------------
# Run from the project root with: `npm run dbuild`
# ------------------------------------------------------------------------------


# Create the `.npmrc` file with the secret access token retrieved
# from an environment variable.
echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > ./docker/.npmrc


# Build the docker image.
docker build -t philcockfield/base .


# Delete the file containing the token secret.
rm ./docker/.npmrc
