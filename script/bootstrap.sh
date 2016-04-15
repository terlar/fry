#!/usr/bin/env bash
ppa=ppa:fish-shell/${FISH_PPA:-nightly-master}
sudo add-apt-repository -y $ppa
sudo apt-get update
sudo apt-get -y install fish realpath

curl -Lso fish-tank-master.tar.gz https://github.com/terlar/fish-tank/archive/master.tar.gz
tar -zxf fish-tank-master.tar.gz
cd fish-tank-master
sudo make install
