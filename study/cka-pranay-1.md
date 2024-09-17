


6. If you want clustered deployment for PTFE, you backend database has to be?
- PostgreSQL

7. Which terraform command will Manually mark a resource for recreation
- terraform taint 

8. A _______ can be thought of as 1 smallest unit of your infrastructure.
- resource


9. terraform state list shows you resource1, resource2, and resource3. You like to see the details (attributes) of resource2. Which command?
-  terraform state show resource2

10. Which is NOT a part of provider.tf file? (for aws)
- availability zone

12. Can a list have the same value twice?
- Yes
- map can not have the same value twice 

19. Terraform loads/executes which files?
- .tf and .tf.json

29. Using some providers require downloading of data:
- True 
- SOME PROVIDERS HAVE DATA I GUESS

31. Which of the following is NOT supported as backend:
- artifactory

38. Any set of terraform config files in a folder can be a _____________
- module 


43. Variable that enables debug/verbose level logging:
- TF_LOG
- do TF_LOG for standard I guess - they said "verbose" ???


49. How to ensure the user is using terraform version later than 0.11?
-Answered below 
<pre>
terraform {
    required_version = "> 0.11.0"
}
</pre>
- required_version required_version required_version
- working file here - go figure
<pre>
terraform {
  required_version = ">= 0.13.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 2.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.1.0"
    }
  }
}
</pre>
