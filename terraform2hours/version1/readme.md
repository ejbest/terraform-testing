##### Terraform in 2 Hours ##### 

###### Please see the link ######

https://www.youtube.com/watch?v=SLB_c_ayRMo&t=7827s

- this should be in a completed state 
- ready to run 

###### Prepare ######

1. Have a working AWS Command Line setup
- Verify your account with 
- aws sts get-caller-identity
2. Ensure you have a ".pem" key file
- mine is called ej.pem on your account
- change line #123 from "ej" to "yourkeyname"
3. Ensure terraform is installed later than 1.5.7
- terraform version

###### Apply Steps ######

1. be in a workable directory on your computer
2. git clone https://github.com/ejbest/terraform-testing.git
3. terraform init 
4. terraform apply 
5. see the output 
6. you can see a test; outputs will will show for public ip/dns 
7. ssh -i yourkey ubuntu@publicip/dns 
8. in browser publicip/dns 

###### Feedback ######
- let me know your outcome 
- please share anything and let me help you on your journey 