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

### Installation

Simply execute the `auto-install.sh` script

```
./auto-install.sh
```

### Auto-Install Products

| Type             | Name             | Remarks                      | Listening Port |
|------------------|------------------|------------------------------|---------------:|
| Docker image     | e-mission-phone  | size: ~400MB                 |            N/A |
| Docker image     | e-mission-server | size: ~8GB                   |            N/A |
| Docker network   | ems              |                              |            N/A |
| Docker volume    | ems-mongo_data   | ems-mongo's data volume      |            N/A |
| Docker container | ems-mongo        | base image: mongo:latest     |          27018 |
| Docker container | ems-phone        | base image: e-mission-phone  |           3000 |
| Docker container | ems-server       | base image: e-mission-server |           8080 |

