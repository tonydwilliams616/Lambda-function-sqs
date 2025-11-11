data "aws_caller_identity" "current" {}


resource "aws_iam_role" "github_oidc_role" {
  name = "GitHubActionsTerraformRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_user}/${var.github_repo}:*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "attach_admin_policy" {
  name       = "github-actions-admin"
  roles      = [aws_iam_role.github_oidc_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}