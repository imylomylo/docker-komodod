**tl;dr;** put your chain data in the node directory, alternatively change the --mount settings when you run it

```
git clone https://github.com/imylomylo/docker-komodod.git
cd docker-komodod
sudo docker build -t komdood .
sudo docker run -it -p 7770:7770 -p 127.0.0.1:7771:7771   --mount src=/home/me/docker-komodod/node,target=/root/.komodo,type=bind --mount src=/home/me/.zcash-params,target=/root/.zcash-params,type=bind komodod
```
it will drop you into a shell
```
/komodo/src/komodod -daemon &
/komodo/src/komodo-cli getinfo
```


**Tips:**
 - It is designed so that you have the zcash-params already downloaded, so you can reuse them across many containers/blockchains in the ecosystem.
 - The node directory has the blockchain data and config.
 - Runs as root - this will get updated
 - The node/komodo.conf file has rpcuser and rpcpassword.  You can use curl to interact.
 - Alternatively something like `sudo docker exec /komodo/src/komodo-cli getinfo` might work
 - curl should work, something like `curl --user rpcuser:passworddrowssap --data '{"method": "getinfo"}' http://127.0.0.1:7771`
