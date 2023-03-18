resource "aws_iam_user" "admin-user" {
  name = "admin-user"
}

data "aws_iam_policy" "administrator-access" {
  name = "AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "admin-user-policy" {
  policy_arn = data.aws_iam_policy.administrator-access.arn
  user       = aws_iam_user.admin-user.name
}

output "admin-user-arn" {
  value = aws_iam_user.admin-user.arn
}
