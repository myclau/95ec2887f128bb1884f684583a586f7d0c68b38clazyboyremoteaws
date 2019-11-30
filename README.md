# 95ec2887f128bb1884f684583a586f7d0c68b38clazyboyremoteaws

# Prerequisite

1. any linux env with bash
2. able to have outbound traffic (i.e can ping 8.8.8.8)

# Installation

1. if you do not have awscli please install (This is for Ubuntu, if other linux may need to update the install script)
```bash
./install_awscli.sh

```
	if not ubuntu can reference here `https://docs.aws.amazon.com/zh_tw/cli/latest/userguide/cli-chap-install.html`
2. Update the conf in `awscli-conf`

awscli-conf/credentials
```bash
[default]
aws_access_key_id=<fill in aws access key>
aws_secret_access_key=<fill in aws secret>
```
awscli-conf/config
```bash
[default]
region=<input region>
output=json

```
3. Update the default pem for login aws machine

aws-default.pem
```bash
-----BEGIN RSA PRIVATE KEY-----

<YOUR PEM>

-----END RSA PRIVATE KEY-----
```
4. Update the default config for awscli by running
```bash
.\update_awscli_config.sh
```
5. Once all ready you can run 
```bash
./install_awssh.sh
```
6. Relogin then install finish

# How to Use
1. if you want to access ec2 instance with tag name "AAA" with default authorization, run
```bash
awssh "AAA"
```
2. if your usename to login the ec2 not ec2-user, please run as
```bash
awssh "AAA" "centos"
```
3. if your pem cannot use the default pem, you need to create another .pem file and run 
```bash
./install_awssh.sh
```
once the .pem already install,you can run as
```bash
#must input username as well
awssh "AAA" "centos" "mycentos.pem"
```

# Expected result
```bash
$ awssh my-server-001
ssh -i "~/awssh/aws-default.pem" ec2-user@3.0.119.18
[ec2-user@ip-3-0-119-18 ~]$

$ awssh not-existing-host
Host not found / NO Public Address

$ awssh my-server-001 cloudadm
ssh -i "~/awssh/aws-default.pem" cloudadm@3.0.119.18
[cloudadm@ip-3-0-119-18 ~]$

$ awssh my-server-001 ec2-user my-server-00.pem
ssh -i "~/awssh/my-server-00.pem" ec2-user@3.0.119.18
[ec2-user@ip-3-0-119-18 ~]$

```

# Logical thinking
1. need to know how to use awscli , using query and filter output to return the instance public IP
2. if not return any result mean Host not found / NO Public Address
3. use ssh to connect
4. once the script finish write it as function in put it in ~/.bashrc so that can call the function name directly in command prompt when you relogin

# Limitation & Assumption
1.  Assume the Tag "Name" is unique this also the limitation on my current work
2. if you have many machine in many account and different region the tool is not work
3. it only work for the same account, same region
4. to work for this you will need to add each region for each account to the `~/.aws/credentials` `~/.aws/config`
5. and add param to allow input profile name.




