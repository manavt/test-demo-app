FTP (File Transfer Protocol) is a relatively old and most used standard network protocol
used for uploading/downloading files between two computers over a network.
However, FTP by its original insecure, because it transmits data together with user
credentials (username and password) without encryption.


Note: FTP can be made secure using connection with SSL/TLS,
May be in higher semester you will learn about it

Step 1: Installing VsFTP Server in Ubuntu
1. First, we need to update the system package sources list and then install VSFTPD binary package as follows:
sudo apt-get update
sudo apt-get install vsftpd

2. Once the installation completes, the service will be disabled initially, therefore,
we need to start it manually for the mean time and also enable it to start automatically from
the next system boot:

------------- On SystemD/Service -------------
# systemctl/service start vsftpd
# systemctl/service enable vsftpd
