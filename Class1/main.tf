resource "aws_iam_user" "lb" {
    name = "hello"
}

resource "aws_iam_user" "lb1" {
    name = "hello1"
}

resource "aws_iam_group" "dev" {
  name = "developers"
}


resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb.name,
    aws_iam_user.lb1.name,
  ]
  group = aws_iam_group.dev.name
}