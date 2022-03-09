resource "aws_security_group" "demo_allow_all" {
  name = "demo_allow_all"
  description = "For all port access"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "OPEN TO ALL"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
}
}

resource "aws_security_group" "web_access" {
  name = "web_access"
  description = "For web access"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks

  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks

  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "OPEN TO ALL"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
}
}


resource "aws_security_group" "ssh_access" {
  name = "ssh_access"
  description = "for ssh connectivity"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks

  }


}
