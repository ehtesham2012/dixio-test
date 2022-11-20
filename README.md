# dixio-test
Deploy a SFTP server able to receive text files in an "incoming" folder 
Develop feature that will read the first 20 characters of the uploaded files, store it, and then delete the file 

Steps:
1) create a non-user Id using IAM service in AWS
2) create a security key pair, security group (inbound: type- ssh, protocol - TCP, port - 22, source IP range) and subnet to allow sftp connenction
3) create a AWS credential in Jenkins to run aws cli commands
4) create a jenkins job to clone git branch and execute aws cli command to create AWS EC2 instance
5) starup.sh script is to clone the script files into EC2 instance and execute file_read_delete.sh script
6) file_read_delete.sh will run every 10 mins to check any text files in the /incoming folder and get first 20 characters from that file to write into a new file and delete original file from /incoming folder.

AWS CLI command to launch EC2 instance:
aws ec2 run-instances --image-id $imageId --count 1 --instance-type $instanceType --key-name $key-pair-name  --security-group-ids $security-group-Ids --subnet-id $subnetId --region $region --user-data $user-data-script

Example:
aws ec2 run-instances --image-id ami-08c40ec9ead489470 --count 1 --instance-type t2.micro --key-name sftp-test-key  --security-group-ids sg-02aa05f8c8d4bd9f0 --subnet-id subnet-0b23d2a4ff17526b8 --region us-east-1 --user-data file://"%WORKSPACE%\startup.sh
