#!/bin/bash

# Step 1: Create two folders within two systems
mkdir -p /home/kali/A
mkdir -p /home/kali/B

# Step 2: Copy public key from sender's system
scp sender_ip:/path/to/sender/userA_public_key.pem /home/kali/A/

# Step 3: Decrypt the received data (assuming symmetric encryption was used)
openssl rsautl -decrypt -inkey /home/kali/B/userA_private_key.pem -in /home/kali/B/encrypted_data.bin -out /home/kali/B/decrypted_data.txt

# Verify signature
openssl dgst -sha256 -verify /home/kali/B/decrypted_signature.bin -signature /home/kali/B/decrypted_signature.bin /home/kali/B/decrypted_data.txt
