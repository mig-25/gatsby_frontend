FROM node:19-bullseye
EXPOSE 8000

RUN npm config set unsafe-perm true
RUN npm install -g gatsby-cli
WORKDIR /app
COPY ./package.json /app
#RUN npm cache clean --force
RUN yarn install  
COPY . /app

#RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache
RUN gatsby build 
CMD ["gatsby", "develop", "-H", "0.0.0.0" ]