FROM node

LABEL maintainer="mehran.hamedaninezhad@gmail.com"

WORKDIR /home

RUN git clone https://github.com/mehranhamedani/npd-api.git

WORKDIR /home/npd-api

RUN npm install

CMD [ "npm", "start" ]