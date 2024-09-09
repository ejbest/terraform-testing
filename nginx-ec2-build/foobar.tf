variable "candy_list" {
  type = list(string)
  default = ["snickers", "kitkat", "reeces", "m&ms"]
}
 
output "give_me_candy" {
  value = element(var.candy_list, 2)
}

