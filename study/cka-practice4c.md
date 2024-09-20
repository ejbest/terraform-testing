



46. After running terraform apply, you notice some odd behavior and need to investigate. Which of the following environment variables will configure Terraform to write more detailed logs to assist with troubleshooting?
- TF_LOG=TRACE


57. You have declared a variable named db_connection_string inside of the app module. However, when you run a terraform apply, you get the following error message:
<pre>
Error: Reference to undeclared input variable
 
on main.tf line 35:
4: db_path = var.db_connection_string
 
An input variable with the name "db_connection_string" has not been declared. This variable can be declared with a variable "db_connection_string" {} block.
</pre>
- since the variable was declared within the module, it cannot be referenced outside of the module
- Variables declared within a module are scoped to that module and cannot be directly referenced outside of it. In this case, the variable "db_connection_string" was declared inside the "app" module, so it cannot be accessed outside of the module without proper scoping or passing it as an output.
