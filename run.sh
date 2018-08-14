#!/bin/bash
echo "/komodo/src/komodod  -txindex=1  -ac_supply=100000000  &"
sudo rm -Rf node/regtest
sudo docker run -it -p 127.0.0.1:7771:7771 --mount src=/home/${USER}/docker-komodod-smartcontracts/node,target=/root/.komodo,type=bind --mount src=/home/${USER}/.zcash-params,target=/root/.zcash-params,type=bind komodo
#sudo docker run -it -p 127.0.0.1:7771:7771 --mount src=/home/${USER}/docker-komodod-smartcontracts/node,target=/root/.komodo,type=bind --mount src=/home/${USER}/.zcash-params,target=/root/.zcash-params,type=bind kmd-cc

#sudo docker stop $(sudo docker ps -a -q)
#sudo docker ps -a
#sudo docker rm $(sudo docker ps -a -q)
