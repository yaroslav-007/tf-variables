###Generating random pet for the new hostname
resource "random_pet" "server" {
  length = "1"
  separator = "-"
}

###Output of the generated hostname
output "name" {
  value = "web-${var.lin-os}-${random_pet.server.id}"
}

variable "lin-os" {
    type = "string"
    default = "lin"
    description = "Name convention putting the OS in the name of the system"
}

###Generating hostname output with echo command  
resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo This generates name the following hostname  web-${var.lin-os}-${random_pet.server.id}"
  }
}