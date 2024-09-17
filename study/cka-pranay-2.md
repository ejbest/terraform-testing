
2. If provider needs downloading of data, in which phase does it happen?
- plan

6. How to find out which version of terraform you are using? Choose 2
- terraform version
- terraform -v

22. The ____________ resource implements the standard resource lifecycle but takes no further action.
- nulll_resource


27. Supported VCS: One of the following is incorrect.
- azure devops server and CVS both

29. Resource Graph is:
- Changes and Dependencies

37. Which of the following is NOT a valid string functions:
- tostring

42. Defined within instance.tf, the ___________ parameter is used to override the SSH defaults
- connection

48. What does this command do?   terraform state mv 'packet_device.worker' 'packet_device.helper'
- renames the packet_device resource named worker to helper

49. Terraform can manage cross-cloud dependencies:
- True

54. What should you use if you need to get dynamic information (i.e. List of AMIs, List of Availability Zones, etc.)?
- Data source

55. Which type does the length function not work on?
- number

<b>BACKENDS</b><br>
Which of the following is NOT supported as backend:
- Not: github, heroku, 
- MAYBE: artifactory 
Is good for BACKEND STATE
<pre>    S3
    AzureRM
    Consul
    COS
    GCS
    Kubernetes
    Local
    OSS
    Postgres
    Remote </pre>

<b>STATE</b><br>
terraform state list shows you resource1, resource2, and resource3. You like to see the details (attributes) of resource2. Which command?
- terraform state show resource2
- FYI terraform state list resource2 just confirms it EXISTS
- use "show resource2"