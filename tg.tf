#Create Target group
resource "aws_lb_target_group" "app" {
  name     = "${var.COMPONENT}-${var.ENV}-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.VPC_ID
}

# Attach the component to TG
resource "aws_lb_target_group_attachment" "attach_instance" {
  count             = var.OD_INSTANCE_COUNT + var.SPOT_INSTANCE_COUNT  
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = element(local.INSTANCE_IDS, count.index)
  port             = var.APP_PORT
}