variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "ml.t2.medium"
}

variable "initial_instance_count" {
  default = "1"
}

variable "variant_name" {
  default = "variant-1"
}

variable "sagemaker_model" {
  default = "matchMaking-2021-06-22-v4-dev"
}

variable "sagemaker_ec" {
  default = "matchMaking-endpointConfigration-ml-c5-xlarge-2021-06-22-dev-v1"
}

variable "sagemaker_e" {
  default = "matchMaking-2021-06-01-v4-dev"
}