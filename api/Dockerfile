FROM node

LABEL maintainer="mehran.hamedaninezhad@gmail.com"

WORKDIR /home

RUN git clone https://github.com/mehranhamedani/npd.git

WORKDIR /home/npd

RUN npm install

CMD [ "npm", "start" ]