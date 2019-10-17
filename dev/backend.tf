terraform {
    backend "s3" {
        bucket = "webserverterraformbay"
        dynamodb_table = "terraform-lock"
        region = "eu-central-1"
        key = "terraformwebserverstate/dev"
    }
}