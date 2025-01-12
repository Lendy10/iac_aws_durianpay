remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "durianpay-terraform-storage"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}

inputs = {
  region      = "ap-southeast-1"
  name = "${basename(get_terragrunt_dir())}"
  arn = "arn:aws:iam::593793060241:role/terraform-role"
}