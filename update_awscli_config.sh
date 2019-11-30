#!/bin/bash
mkdir -p ~/.aws

rm -f ~/.aws/credentials
rm -f ~/.aws/config
cp ./awscli-conf/credentials ~/.aws/credentials
cp ./awscli-conf/config ~/.aws/config


