# NPD

NPD: Nodejs(Express+Sequelize+Babel+Jest)+Postgres+Docker

## Installation

# Step 1: install docker

If you have docker, you can skip this step

[How To Install and Use Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)

# Step 2: install docker-compose

If you have docker-compose, you can skip this step

[How To Install Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04)

# Step 3: git clone

```bash
$ git clone https://github.com/mehranhamedani/npd-docker
```

# Step 4: change work dir

```bash
$ cd npd-docker
```

# Step 4: run docker-compose

```bash
$ docker docker-compose up -d
```


# Stemp 6: Test by curl and Postman

curl:

```bash
$ curl http://[host-name-in-config]:[port-name-in-config]/api/food/getFoods
```

Postman:

You can import Postman json file for test by postman:

  * postman/food.postman_collection.json

  * postman/localhost.postman_environment.json

  * postman/server.postman_environment.json
