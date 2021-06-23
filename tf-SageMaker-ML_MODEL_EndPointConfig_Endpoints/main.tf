resource "aws_sagemaker_model" "sm_model" {
  name               = var.sagemaker_model
  execution_role_arn = aws_iam_role.sm_model.arn

  primary_container {
    image = "240029911271.dkr.ecr.us-east-1.amazonaws.com/paro-sagemaker-matchmaking:dev-v1"
  }
}

resource "aws_iam_role" "sm_model" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

resource "aws_sagemaker_endpoint_configuration" "ec" {
  name = var.sagemaker_ec

  production_variants {
    variant_name           = var.variant_name
    model_name             = aws_sagemaker_model.sm_model.name
    initial_instance_count = var.initial_instance_count
    instance_type          = var.instance_type
  }

  tags = {
    Name = "endpoint-config"
  }
}

resource "aws_sagemaker_endpoint" "e" {
  name                 = var.sagemaker_e
  endpoint_config_name = aws_sagemaker_endpoint_configuration.ec.name

  tags = {
    Name = "endpoint"
  }
}