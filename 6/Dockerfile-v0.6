FROM ubuntu
LABEL maintainer="Allen Day allenday@allenday.com"
RUN apt-get update && apt-get install -y software-properties-common python3-software-properties
RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y && apt-get update
RUN apt install -y autoconf autogen build-essential c++17 catch clang-5.0 cmake g++-7 gcc-7 git libargtable2-dev libboost-all-dev libboost-filesystem-dev libboost-iostreams-dev libboost-serialization-dev libboost-test-dev libboost-thread-dev libbz2-dev libcurl4-openssl-dev libgflags-dev libhiredis-dev libjemalloc-dev libjsoncpp-dev libjsonrpccpp-dev libjsonrpccpp-tools liblmdb-dev liblz4-dev libmicrohttpd-dev libsnappy-dev libsparsehash-dev libsqlite3-dev libssl-dev libtool libzstd-dev python3-dev python3-pip wget zlib1g-dev
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7

WORKDIR /root
RUN git clone https://github.com/bitcoin-core/secp256k1
WORKDIR /root/secp256k1
RUN sh ./autogen.sh
RUN ./configure --enable-module-recovery
RUN make install

WORKDIR /root
RUN git clone https://github.com/citp/BlockSci.git
WORKDIR /root/BlockSci
RUN git submodule init
RUN git submodule update --recursive
RUN git fetch origin 'v0.6':'v0.6'
RUN git checkout 'v0.6'
RUN ln -s external libs
RUN cp -r libs/range-v3/include/meta /usr/local/include
RUN cp -r libs/range-v3/include/range /usr/local/include
RUN mkdir -p /root/BlockSci/release

WORKDIR /root/BlockSci/external/rocksdb
RUN make static_lib
RUN make shared_lib
RUN make install

WORKDIR /root/BlockSci/release
RUN CC=gcc-7 CXX=g++-7 cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make install

WORKDIR /root/BlockSci/
RUN CC=gcc-7 CXX=g++-7 pip3 install -e blockscipy

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade multiprocess psutil jupyter pycrypto matplotlib pandas dateparser

RUN mkdir /root/BlockSci/external/bitcoin-api-cpp/release
WORKDIR /root/BlockSci/external/bitcoin-api-cpp/release
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make install
RUN mkdir /data
WORKDIR /data
