rm -rf ~/awssh
mkdir -p ~/awssh
cp awssh.sh ~/awssh/awssh.sh
cp *.pem ~/awssh

if ! grep -Fxq "source ~/awssh/awssh.sh" ~/.bashrc
then
	echo "" >> ~/.bashrc
	echo "source ~/awssh/awssh.sh" >> ~/.bashrc
fi
