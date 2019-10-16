terraform {
    backend "s3" {
        bucket = "webserverterraformbay"
        key = "terraformwebserverstate/dev"
    }
}