resource "aws_elb" "elb" {
  name               = "bhanu-terraform-elb"
    subnets = ["subnet-0a1db4afda8fadacb"]
  security_groups = ["sg-002881f3e27c22e65"]
  access_logs {
    bucket        = "bhanu-fr24"
    bucket_prefix = "bar"
    interval      = 60
  }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 443
    lb_protocol       = "https"
    ssl_certificate_id = "arn:aws:acm:eu-west-2:304835920974:certificate/e9d107ee-11cf-4022-809a-822dee76fd5c"
  }

  

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["i-00bd2c0f649faa4f9","i-0c40fc700df755824","i-0fac5de667aa9f749"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "bhanu-terraform-elb"
  }
}

