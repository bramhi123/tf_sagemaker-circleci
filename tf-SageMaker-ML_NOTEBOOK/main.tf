resource "aws_sagemaker_notebook_instance" "ni" {
  name          = "tf-serviceLineHirerachy"
  role_arn      = aws_iam_role.notebook_iam_role.arn
  instance_type = "ml.t2.medium"
  tags = {
    Name = "ML"
  }
}