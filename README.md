# machine learning docker image

## CPU
```
$ docker run --name jupyter-machine-learning -d --restart=always -v /home:/home -p 8888:8888 -e PASSWORD=jupyter shimtom/machine-learning:latest
```



## GPU
```
$ nvidia-docker run --name jupyter-machine-learning -d --restart=always -v /home:/home -p 8888:8888 -e PASSWORD=jupyter shimtom/machine-learning:latest-gpu
```
