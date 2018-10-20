# Dockerised e-mission-devenv 

This repo contains shell scripts and docker files to create a development environment for [e-mission app](https://github.com/e-mission).

### Prerequisites

We need `e-mission-phone` and `e-mission-server` at our root directory.

The directory structure should look like this

```
<root>
|- src
|--- e-mission-phone
|--- e-mission-server
```

To prepare our directory, Simply execute the `prerequisites.sh` script

```
./prerequisites.sh
```

or

We can manually clone those project into root directory ourselves

```
git clone https://github.com/e-mission/e-mission-phone.git src/e-mission-phone
git clone https://github.com/e-mission/e-mission-server.git src/e-mission-server
```

### Configuration

Update `<your laptop ip>` with your IP Address in `res/e-mission/phone/connectionConfig.json`

### Installation

Simply execute the `auto-install.sh` script

```
./auto-install.sh
```

### Auto-Install Products

| Type             | Name             | Remarks                      |    Listening Port |
|------------------|------------------|------------------------------|------------------:|
| Docker image     | e-mission-phone  | size: ~400MB                 |               N/A |
| Docker image     | e-mission-server | size: ~8GB                   |               N/A |
| Docker network   | ems              |                              |               N/A |
| Docker volume    | ems-mongo_data   | ems-mongo's data volume      |               N/A |
| Docker container | ems-mongo        | base image: mongo:latest     | 27018, alt: 27019 |
| Docker container | ems-phone        | base image: e-mission-phone  |  3000, alt: 13000 |
| Docker container | ems-server       | base image: e-mission-server |  8080, alt: 18080 |

### File mapping

- phone
  - `connectionConfig.json`: `/usr/src/app/www/json/connectionConfig.json`
- server
  - `db.conf`: `/usr/src/app/conf/storage/db.conf`
  - `webserver.conf`: `/usr/src/app/conf/net/api/webserver.conf`
  - `seed_model.json`: `/usr/src/app/seed_model.json`


### Running ems-server with seed_model.json

To run `ems-server` with `seed_model.json`,

put `seed_model.json` to `res/e-mission-server/confidentials/seed_model.json`.

This file will not be published onto github repository.

Then add the following line **before the last line** of `run.server.sh` file:

```
--mount type=bind,source="$(pwd)"/res/e-mission-server/confidentials/seed_model.json,target=/usr/src/app/seed_model.json,readonly \
```

Then execute `run-force.server.sh`
