#安装钱包所需环境
echo "\$nrconf{kernelhints} = 0;" >> /etc/needrestart/needrestart.conf
echo "\$nrconf{restart} = 'l';" >> /etc/needrestart/needrestart.conf

curl -sSL https://raw.githubusercontent.com/allora-network/allora-chain/main/install.sh | bash -s -- v0.0.7
sudo apt-get update  -y
sudo apt-get install -y make gcc
rm -rf /usr/local/go
curl -OL https://go.dev/dl/go1.22.4.linux-amd64.tar.gz 
sudo tar -C /usr/local -xvf go1.22.4.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
go version

#安装allora钱包
git clone -b <latest-release-tag> https://github.com/allora-network/allora-chain.git
cd allora-chain && make all
echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
allorad version

#创建钱包
allorad keys add wallet

cd
rm -rf add_wallet.sh
rm -rf go*
