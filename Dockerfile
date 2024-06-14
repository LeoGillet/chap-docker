FROM debian:10-slim
LABEL name="chap"
LABEL description="Container bundled with CHAP & GROMACS installations"
LABEL url="https://github.com/LeoGillet/chap-docker"
LABEL maintainer="Léo Gillet <leo@leogillet.com>"


# System deps
RUN apt update && \
    apt install -y curl gcc g++ cmake cpanminus

# FFTW installation
WORKDIR /opt
RUN curl -sLo fftw.tar.gz "https://www.fftw.org/fftw-3.3.10.tar.gz" && \
    tar xzf fftw.tar.gz && \
    rm fftw.tar.gz 

WORKDIR /opt/fftw-3.3.10
RUN ./configure --enable-shared --enable-float --enable-threads --enable-sse2 --enable-avx --enable-avx2 --enable-avx512 && \
    make && \
    make install

# GROMACS installation
WORKDIR /opt
RUN curl -sLo gromacs.tar.gz "http://ftp.gromacs.org/pub/gromacs/gromacs-2018.8.tar.gz" && \
    tar xzf gromacs.tar.gz && \
    rm gromacs.tar.gz
RUN mkdir /opt/gromacs-2018.8/build

WORKDIR /opt/gromacs-2018.8/build
RUN cmake ..  -DGMX_BUILD_OWN_FFTW=OFF -DREGRESSIONTEST_DOWNLOAD=OFF && \
    make && \
    make install && \
    chmod +x bin/gmx && \
    ln -s /opt/gromacs-2018.8/build/bin/gmx /usr/bin/gmx


# CHAP dependancies
RUN apt install -y libboost-all-dev libblas-dev libatlas-base-dev libopenblas-dev liblapacke-dev

# CHAP installation
WORKDIR /opt
RUN curl -sLo chap.tar.gz "https://github.com/channotation/chap/archive/version_0_9_1.tar.gz" && \
    tar xzf chap.tar.gz && \
    rm chap.tar.gz && \
    mkdir chap-version_0_9_1/build

WORKDIR /opt/chap-version_0_9_1/build
RUN cmake .. && \
    make && \
    make install && \
    mkdir bin && \
    chmod +x chap && \
    ln -s /opt/chap-version_0_9_1/build/chap /usr/bin/chap
    
WORKDIR /