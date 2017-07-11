variable "accountids" {
    type = "map"

    default = {
        account-core               = "000000000000"
        account-dev1               = "111111111111"
    }
}

output "accountid" {
    value = "${lookup(var.accountids, var.project)}"
}
