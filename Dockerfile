# FROM node:lts-bullseye-slim
FROM node:16-alpine

# ENV

ENV NODE_ENV=$NODE_ENV
ENV PORT=$PORT
ENV DB_HOST=$DB_HOST
ENV DB_DATABASE=$DB_DATABASE 
ENV DB_PORT=$DB_PORT 
ENV DB_SSL=$DB_SSL 
ENV DB_USER=$DB_USER 
ENV DB_PASSWORD=$DB_PASSWORD

# update packages
#RUN apk update

# create root application folder
WORKDIR /variaMosLenguageService

# copy configs to /variaMosLenguageService folder
COPY package*.json ./
COPY tsconfig.json ./

# COPY dist/ ./dist

RUN npm install

# copy source code to /variaMosLenguageService/src folder
COPY ./ . 

# # check files list
# RUN ls -a

RUN npm run build


# RUN groupadd veryhigh -g 1516583083
# RUN useradd -r -u 1516583083 -g veryhigh veryhigh
# RUN touch file-with-high-id
# RUN chown veryhigh:veryhigh file-with-high-id

#RUN chown -R root:root /home
#RUN chown -R root:root /var

EXPOSE 4000

CMD [ "npm", "start" ]
