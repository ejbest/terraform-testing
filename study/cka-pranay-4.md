









12. What is the result of this:
lookup ({d="1", e="2"}, "f", "3")
- 3 

13. What are First Class Expressions? Started with Terraform 0.12 
- Referencing Terraform variables and resource arguments without interpolation

14. If you manipulate the local state file using "terraform state rm" command, what does terraform do automatically as a precautionary step?
- backs up the state in a file like: terraform.tfstate.123456789.backup

16. To publish to Terraform's public module registry name has to be in ___________ format
- terraform-<PROVIDER>-<NAME>
- devil in the detail 

21. In a .tf file, you are defining a resource. This resource has policy attribute. In the policy, you want to refer this resource's id attribute. Can you do it?
- NO

22. Which of the following is NOT a Terraform Enterprise feature?
- Sentinel
- OPTIONAL

29. Structural types require a ________ as an argument
- schema

39. A ___________ type allows multiple values of several distinct types to be grouped together as a single value
- structural

49. It is secure practice to omit secrets when storing state in the backend. Given that's done, can you directly query Hashicorp Vault for secrets when trying communicate with the backend?
- No

53. Plugins execute as separate processes:
- True