# Dockerfile must start with a FROM instruction
# FROM instruction specifies the Base Image from which you are building
# FROM <image>[:<tag>]
FROM ubuntu:16.04
# Install bitcoind from PPA
RUN apt-get update && \
 apt-get install -y  build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libqt4-dev libqrencode-dev libdb++-dev ntp ntpdate vim software-properties-common curl libcurl4-gnutls-dev cmake clang screen htop sudo

RUN git clone https://github.com/nanomsg/nanomsg && \
  cd nanomsg && \
  cmake . -DNN_TESTS=OFF -DNN_ENABLE_DOC=OFF && \
  make -j$(nproc) && \
  make install && \
  ldconfig  

#RUN useradd -u 3003 -m komodo 

#USER komodo

#WORKDIR /home/komodo

RUN git clone https://github.com/KomodoPlatform/komodo.git && \
  cd komodo && \
  ./zcutil/build.sh -j$(nproc)


# copy dir with conf and blocks
#ADD . /home/komodo/data
    
# EXPOSE rpc port for the node to allow outside container access
EXPOSE 7770 7771

# There can only be one CMD instruction in a Dockerfile
# CMD provides defaults for an executing container
# Drop user into bash shell by default
CMD ["/bin/bash"]

#docker run -it -p 27485:27485 verusd

#FROM ANOTHER TERMINAL
#curl --user someuser:somepass --data '{"method": "getblockchaininfo"}' http://127.0.0.1:27486
