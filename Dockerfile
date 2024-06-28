FROM node:latest

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
#RUN npm install -g react-scripts@3.4.1 -g --silent

#add app to container
COPY . ./
CMD ["npm", "start"]
