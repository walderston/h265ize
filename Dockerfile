FROM amd64/ubuntu:18.04
MAINTAINER walderston

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LD_LIBRARY_PATH /lib/x86_64-linux-gnu:/usr/local/nvidia/lib:/usr/local/nvidia/syslib:/usr/local/nvidia/applib:/usr/local/NVIDIA_GPU_DRV/cuda-10.0/lib64/

RUN apt-get update
RUN apt -y install enca dbus npm git
RUN npm install walderston/h265ize --global --no-optional
RUN ln -s /usr/local/nvidia/bin/ffmpeg /usr/bin/ffmpeg
RUN ln -s /usr/local/nvidia/bin/ffprobe /usr/bin/ffprobe


RUN apk add --no-cache --update-cache git ffmpeg && \
    npm install walderston/h265ize --global --no-optional && \
    mkdir /input && \
    mkdir /output

VOLUME ["/input", "/output", "/usr/local/nvidia","/usr/local/NVIDIA_GPU_DRV"]
WORKDIR /h265ize

ENTRYPOINT ["/usr/local/bin/h265ize", "/input", "--delete"]
