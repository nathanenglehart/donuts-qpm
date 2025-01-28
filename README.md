# Law of large numbers demo 

This repository contains `R` code with an accompanying Dockerfile to run an animated simulation of the law of large numbers. 

![LLN animation here](animate_mu.gif)

## How to run

To run the code in this repository first build and run the `docker` image. Then run the `R` script.

```bash
cd donuts-qpm
sudo docker build -t nathanenglehart/donuts-qpm .
sudo docker run -it nathanenglehart/donuts-qpm
Rscript animate_mu.r
```

The `mp4` file can be recovered by opening another terminal and running.

```bash
sudo docker cp container-id:/app/mu_animation.mp4 /path/to/mu_animation_1.mp4
```

The container id can be obtained by running `sudo docker ps`. To exit to the `docker` image, simply type `exit`.



