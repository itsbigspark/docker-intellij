# Docker image for IntelliJ IDEA Community edition, JDK 1.8

The image contains the following software:

- [IntelliJ IDEA Community 2019.2](https://www.jetbrains.com/idea/)
- Gradle
- OpenJDK 8
- Git
- Cmake

## Running

By running the following command you'll be able to start the container

```bash
XSOCK=/tmp/.X11-unix && sudo docker \
run -i -v $XSOCK:$XSOCK \
--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
-e DISPLAY \
-t [image-name]
```

//todo To update the container, simply run:

```shell
docker pull itsbigspark/docker-intellij
```

Plugins can be updated individually at any time, and other plugins
can be installed as well.

However, to update IntelliJ IDEA itself, the docker image will need to be
updated.

## License

The MIT License (MIT)

Copyright (c) 2019 bigspark Limited

IntelliJ IDEA and all the other plugins are or may be trademarks of their
respective owners / creators. Please read the individual licenses for them.
