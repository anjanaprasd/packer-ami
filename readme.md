##### Hi Everyone,

##### I've written this code to build amazon AMI using the packer amazon-ebs type. This builder build an AMI by launching an AWS EC2 instance base on the given source AMI. Also, it will create a temporary ssh-key, and security group rules to complete the AMI creation process. Once the build  completed. It will destroy all the temporarly created resources, And your AMI will list under the AWS-EC2 --- AMI section.

###### This builder is not an AMI build setup. I've added a separate LVM configuration for the new AMIs using an ansible provisioner. In this scenario, the author has used two provisioners (shell/ansible) to complete this AMI build. This code has written using the HCL language.


<!-- Horizantal rule -->


#### ami-example.pkr.hcl file contains the main configurations related to AMI build.Here, I've used more variables for dry principle.

#### ami-pkvars.hcl file you can add your static variables.

#### variables.pkr.hcl file contains all default variables.

#### ansible-configs diretory contains the ansible releated configuration.

<!-- Horizantal rule -->


### How to exeute this code.

### Step 01. 

 As a first step you have to install packer and ansible in your local system. 

 please refer below link to install packer in your local system.*
  *https://learn.hashicorp.com/tutorials/packer/get-started-install-cli

 Asnible installtion.
 yum install -y ansible (redhat/centos/amazon-linux)
 apt-get install ansible -y (ubuntu)

### Step 02.
Make sure packer and ansible are installed in the system by executing below command.
packer -version 
ansible --version 

### Step 03.
change direcory to where your code is located.
execute packer init command to download required provider plugins.

### Step 04.
format packer code and validate.

packer fmt . 
packer validate .


### Step 05 
Make sure you have authenitcated with aws before executing the command.

### Step 06. 
packer build --var-file=ami.pkrvars.hcl . 


Further you can add your own custom features into this adding more provisioners such as ansible or shell play book into ami-pkvars.hcl.
