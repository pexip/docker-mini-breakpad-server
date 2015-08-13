FROM sporsh/nvm
MAINTAINER  Geir Sporsheim <geir.sporsheim@gmail.com>

# Install Node.js
RUN bash -l -c "nvm install 0.11"
RUN bash -l -c "nvm alias default 0.11"

# Install dependencies for mini-breakpad-server
USER root
RUN apt-get -y install git python build-essential
USER nvm

# Install mini-breakpad-server
RUN bash -l -c "git clone https://github.com/atom/mini-breakpad-server.git"
WORKDIR /home/nvm/mini-breakpad-server
RUN bash -l -c "npm install ."

# mini-breakpad-server listens on port 1127
EXPOSE 1127

CMD bash -l -c "node lib/app.js"
