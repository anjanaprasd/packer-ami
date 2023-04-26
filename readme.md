##### Hi Everyone,

#####Packer and Ansible are used by Amazon AMI Builder.

Using the Packer Amazon-EBS type, the following code creates an Amazon Machine Image (AMI). A temporary SSH key and security group rules are made, the AMI generation procedure is finished, and the builder launches an AWS EC2 instance based on the source AMI that was provided. Your new AMI will be listed in the AWS-EC2 AMI section once the construction is finished, at which point all temporary resources created during the build are destroyed.


Please be aware that this builder is not an AMI build setup and that new AMIs are introduced using an Ansible provisioner and a separate LVM configuration. In this instance, the author built this AMI using two provisioners (shell and Ansible). The HCL language was used to create this program.
Files



<!-- Horizantal rule -->


Files

    ami-example.pkr.hcl: Contains the main configurations related to AMI build. Here, more variables have been used for the DRY principle.
    ami-pkvars.hcl: You can add your static variables to this file.
    variables.pkr.hcl: Contains all default variables.
    ansible-configs directory: Contains Ansible-related configuration.

How to Execute the Code
Step 1: Install Packer and Ansible

As a first step, you need to install Packer and Ansible on your local system. Please refer to the below links for installation instructions:

    Install Packer
    Install Ansible:
        yum install -y ansible (RedHat/CentOS/Amazon Linux)
        apt-get install ansible -y (Ubuntu)

Step 2: Check the Installation

Make sure Packer and Ansible are installed on your system by executing the below commands:

css

packer -version
ansible --version

Step 3: Change Directory

Change directory to where your code is located and execute the packer init command to download required provider plugins.
Step 4: Format and Validate Packer Code

Format the Packer code and validate it using the following commands:

bash

packer fmt .
packer validate .

Step 5: Authenticate with AWS

Make sure you have authenticated with AWS before executing the command.
Step 6: Build the AMI

Execute the following command to build the AMI:

csharp

packer build --var-file=ami.pkrvars.hcl .

That's it! You have successfully built your Amazon AMI using Packer and Ansible.
