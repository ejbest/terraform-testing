

16. You have file foo.tf with 5 resources defined in it. You also bar.tf with another 5 resources defined in it. If concatenate the 2 files and deleted foo.tf bar.tf files, what would be the impact?
- Nothing
- pay attention to what is there; just a different layout of files with the SAME details - nothing was changed other than the files from 2 to 1.

19. Did Terraform 0.11 support splat expressions?
- True

21. When you are creating an ec2 instance with aws_instance resource, how do you give it name that visible in AWS console?
- provide a tag whose key is name
- it was "key" and not "value" ARRGGGGGG

23. If there are multiple .tf files, how will terraform "load" them?
- alphabetical order
- I have googled information to the contrary

25. In Terraform 0.12, you can do:  Note: string does not have any quotes around it. This is possible because:
<pre>
variable "myvar" {
    type = string
}</pre>
- Types are first class values!
- First class variables can be assigned to variables, passed as arguments, or returned as output, while second class variables cannot

27. Example of a provisioner?
- bash
- a provider translates resources and data sources from a cloud provider, while a provisioner executes scripts or commands on a local or remote machine

28. When terraform init downloads plugins, where does it save it?
- .plugins folder
- another UNEXPECTED ANSWEER - WATCH

36. OS NOT supported for clustered terraform enterprise:
- Amazon Linux

44. When you define a data block to retrieve attributes of an already present resource, the format of the first line is drastically different from that of defining a resource
- False
- this is ambiguous and a terrible quesiton

46. Terraform mask masks secrets in you code:
- False
- Terraform can mask passwords in the state file by marking input variables as sensitive:
- Look up masking 

52. When you use partial config , you use _______ command to complete the configuration:
- terraform init
