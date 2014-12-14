#!/usr/bin/env bash
sudo add-apt-repository -y ppa:fish-shell/nightly-master
sudo apt-get update
sudo apt-get -y install fish
curl -Lso fish-tank-master.tar.gz https://github.com/terlar/fish-tank/archive/master.tar.gz
tar -zxf fish-tank-master.tar.gz
cd fish-tank-master
sudo make install
