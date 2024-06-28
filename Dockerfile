FROM node:latest

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./

# TODO: we should really be checking if they use npm or yarn and using different
# dockerfiles, this solves things in very short term
RUN yarn
#RUN npm install -g react-scripts@3.4.1 -g --silent

#add app to container
COPY . ./
RUN yarn build || true

CMD ["yarn", "start"]
