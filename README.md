# wa-herumbra
Sandbox of Umbra browser automation tool by used with the Heritrix in Docker.


## Getting Started


### Prerequisites

```{bash}
docker-compose --version  # requires 1.13 or later
```

### Installing and running

Build

```{bash}
git clone https://github.com/gehorak/wa-herumbra
docker-compose -f ./wa-herumbra/docker-compose.yml --build
```

And running

```{bash}
docker-compose -f ./wa-herumbra/docker-compose.yml -d up
```

## How to use

### Console

Connect into docker container
```{bash}
docker exec -it heritrix /bin/bash  
```

Run harvest

```{bash}
bin/job_start.sh
```

Stop harvest
```{bash}
bin/job_stop.sh
```

### WebGUI

#### RabbitMQ 

guest@guest

[http://host: 15672](http://localhost:15672/)

## Reference

### Software 

[Heritix](https://github.com/internetarchive/heritrix3)   
[Umbra](https://github.com/internetarchive/umbra)   
[RabbitMQ](https://www.rabbitmq.com/)   

Alpine Linux   
Python 3.8   
Java 1.8

### Reference of API

[Heritix API](https://heritrix.readthedocs.io/en/latest/api.html)    
[RabbitMQ API](https://www.rabbitmq.com/api-guide.html)

### Resources

[amqp.org](https://www.amqp.org/)   
[Specification of AMPQ091](ttps://www.rabbitmq.com/resources/specs/amqp0-9-1.pdf)   
https://github.com/celery/py-amqp/



## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details