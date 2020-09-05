# Install the app dependencies in a full Node docker image
FROM node:10
  
WORKDIR "/app"

# Install OS updates 
RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get clean \
 && echo 'Finished installing dependencies'

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install --production

ENV NODE_ENV production
ENV PORT 3000

USER node

EXPOSE 3000
# Copy the rest of your app's source code from your host to your image filesystem.
COPY . ./app

CMD ["npm", "start"]
