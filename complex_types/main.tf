terraform {

}

variable "planets" {
  type    = list(any)
  default = ["mars", "earth", "moon"]
}

variable "plans" {
  type = map(any)
  default = {
    "PlanA" = "10 USD ",
    "PlanB" = "50 USD",
    "PlanC" = "100 USD"
  }
}

variable "plan" {
  type = object({
    PlanName   = string
    PlanAmount = number
  })
  default = {
    "PlanName"   = "Basic",
    "PlanAmount" = 10
  }
}

variable "random" {
  type = tuple ([string,number,bool])
  default = ["hello",22,false]
}

output "planet_from_list________" { value = var.planets[2] }
output "plans_from_map__________" { value = var.plans.PlanB }
output "plan_from_object________" { value = var.plan.PlanAmount }
output "random_from_tuple_______" { value = var.random[2]}

# example of a terraform for_each expression
# used this video https://www.youtube.com/watch?v=JGi_4UlopWY
