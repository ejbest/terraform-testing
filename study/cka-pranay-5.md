
terraform force-unlock [options] LOCK_ID

5. Which of the following is NOT a Terraform Enterprise feature?
- Private Module Registry
- that comes with Terraform Cloud 

9. Dynamic block acts like a :
- for loop

16. Which commands should you use to manipulate terraform state files? (Choose 2)
- terraform import
- terraform state

22. The following is an example of ___________:
<pre>
dynamic "ingress" {
    for_each = var.foo_ports
    content {
        from_port = ingress.value
        to_port = ingres.value
        protocol = "tcp"
    }
}
</pre>
- Dynamic block 
- See type "dynamic" in the top line

25. Something NOT a feature of Terraform Enterprise?
- Private Registry
- Private Registry comes with Terraform Cloud

30. One way to define variables to be used in the child module and give them default values
- Put them in a .tfvars file in the MODULE directory and give them default values

38. Command to import an existing resources into terraform.
- terraform import

41. In Terraform 0.12 , can you return an entire resource from a module?
Yes

42. If you don't specify version when source-ing a module, it will use the default branch referenced by _______
- HEAD
- The HEAD is the last or latest or current version 
- Think of Git

44. How do you limit the number of concurrent operations as Terraform plan walks the graph?
- -parallelism=n

51. Module A calls Module B. Which is the child module?
- Child B is the child module 
Parent Module:
	•	This is the root module, or the main Terraform configuration from which execution begins.
	•	It can call other modules (child modules) and manage the overall infrastructure.
	•	Example:
<pre>
module "network" {
  source = "./modules/network"
}
</pre>