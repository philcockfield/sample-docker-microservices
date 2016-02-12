FROM ubuntu


# ------------------------------------------------------------------------------


# Copy NPM config.
COPY .npmrc /root/.npmrc

# Exclude the NPM cache from the image.
VOLUME /root/.npm


# ------------------------------------------------------------------------------


# Install Node.
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# Install global modules.
RUN npm install -g nodemon
RUN npm install -g pm2


# ------------------------------------------------------------------------------


# Create the app directory.
RUN mkdir -p /opt/app
WORKDIR /opt/app


# Install app.
ONBUILD COPY package.json /opt/app/
ONBUILD RUN npm install
ONBUILD COPY . /opt/app
