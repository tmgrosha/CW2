#!/bin/bash

# Step 1: Create two folders within two systems
mkdir -p /home/rk/A
mkdir -p /home/rk/B

# Step 2: Generate asymmetric keys and data
openssl genpkey -algorithm RSA -out /home/rk/A/private_key_b.pem
openssl rsa -pubout -in /home/rk/A/private_key_b.pem -out /home/rk/A/public_key_b.pem

echo "hello user" > /home/rk/A/data.txt

# Step 3: Copy public keys to the receiver's system
scp /home/rk/A/public_key_a.pem rk@192.168.1.65:/home/rk/A/
scp /home/rk/A/public_key_b.pem rk@192.168.1.65:/home/rk/A/
