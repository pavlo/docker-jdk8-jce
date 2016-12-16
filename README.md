# docker-jdk8-jce
A base docker image with JDK8 from Oracle as well as JCE

## Purpose

This image can be used as a base image for java apps. It has Java 8 Development Kit and Java Cryptography Extension (JCE) from Oracle.

## Usage

Here's how you can launch a SpringBoot application for instance. Compose a Dockerfile like this:

```
FROM pavlikus/jdk8-jce:latest

EXPOSE 3000
WORKDIR /app
COPY build/my-app.jar /app/app.jar
CMD ["bash", "-c", "java -jar $JAVA_OPTS -Dspring.profiles.active=$ACTIVE_PROFILE -Djava.security.egd=file:/dev/./urandom /app/app.jar"]
```

then build it:

```
docker build -t my-java-app:latest .
```

and finally run it:

```
docker run --rm -it my-java-app:latest
```

## Assumptions

It does not do any assumptions about your app, project structure etc! You may use this image to run the compiler, execute java commands and so on and so forth.


## License

MIT Licensed
