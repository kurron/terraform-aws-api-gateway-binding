terraform {
    required_version = ">= 0.10.7"
    backend "s3" {}
}

module "api_gateway" {
    source = "../"

    region                 = "us-west-2"
    api_name               = "Debug API"
    api_description        = "A faux API just to test out the Terraform module"
    api_root_path          = "api"
    api_key_required       = "false"
    target_url             = "http://httpbin.org"
    stage_name             = "development"
    stage_description      = "APIs still under development"
    deployment_description = "Initial cut of the API"
}
