terraform {
    backend "s3" {
        bucket = "webserverterraformbay"
        dynamodb_table = "terraform-state-lock-dynamo"
        region = "eu-central-1"
        key = "terraformwebserverstate/dev"
    }
}