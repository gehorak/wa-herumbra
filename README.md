# wa-herumbra

Sandbox of Umbra browser automation tool by used with the Heritrix in Docker.

## Getting Started

### Prerequisites

 | Software       | Version |
 | -------------- | --------|
 | docker         | 19.3.0  |
 | docker-compose | 1.23.0  |

### Basic verification of requirements

```{bash}
docker --version
docker-compose --version  
git --version
docker pull mcr.microsoft.com/mcr/hello-world
```

### Installing and running

Build

```{bash}
git clone https://github.com/gehorak/wa-herumbra
docker-compose -f ./wa-herumbra/docker-compose.yml --build
```

Running

```{bash}
docker-compose -f ./wa-herumbra/docker-compose.yml -d up
```

## Provided interface of services

| Component   | Container            | Port                              | Protocol | Credentials | Utilization                  |
|-------------|----------------------|-----------------------------------|----------|-------------|------------------------------|
| crawler     | herumbra-heritrix    | [15673](https://localhost:15673/) | https    | admin:admin | crawler                      |
| filemanager | herumbra-filebrowser | [15678](http://localhost:15678/)  | http     | admin:admin | access to the data directory |
| rabbitmq    | herumbra-rabbitmq    | [15672](http://localhost:15672/)  | http     | guest:guest | message broker management    |

## Reference

#### Použité oficiální image Docker kontejnerů

| Docker Image                   | Utilization      |
|--------------------------------|------------------|
| openjdk:8-jdk-alpine           | crawler          |
| python:alpine                  | umbra (chromium) |
| filebrowser/filebrowser:latest | filemanager      |
| rabbitmq:3-management-alpine   | message broker   |

### Software

#### Software and libraries

| Software | Version | Language | Official source of code                      | Utilization             |
|----------|---------|----------|----------------------------------------------|-------------------------|
| Heritix  | 3.4.0   | Java     | https://github.com/internetarchive/heritrix3 | crawler                 |
| Umbra    | 2.1     | Python   | https://github.com/internetarchive/umbra     | browser automation tool |
| RabbitMQ | 3.8     | Erlang   | https://github.com/rabbitmq                  | message broker          |

### Reference of API

| API                                                                    | source links                                       |
|------------------------------------------------------------------------|----------------------------------------------------|
| [Heritix REST API](https://heritrix.readthedocs.io/en/latest/api.html) | https://heritrix.readthedocs.io/en/latest/api.html |
| [RabbitMQ API](https://www.rabbitmq.com/api-guide.html)                | https://www.rabbitmq.com/api-guide.html            |

### Resources

[amqp.org](https://www.amqp.org/)
[Specification of AMPQ091](https://www.rabbitmq.com/resources/specs/amqp0-9-1.pdf)
[Heritrix AMQPUrlReceiver](https://github.com/internetarchive/heritrix3/blob/master/contrib/src/main/java/org/archive/crawler/frontier/AMQPUrlReceiver.java)
[Heritrix AMQPPublishProcessor](https://github.com/internetarchive/heritrix3/blob/master/contrib/src/main/java/org/archive/modules/AMQPPublishProcessor.java)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details