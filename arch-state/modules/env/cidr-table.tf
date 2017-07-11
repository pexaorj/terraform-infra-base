variable "cidrblocktable" {
    type = "map"

    default = {
        account-core                = "10.10.0.0/20"
        account-dev1                = "10.20.0.0/20"
    }
}

output "cidrblockip" {
    value = "${lookup(var.cidrblocktable, var.project)}"
}
