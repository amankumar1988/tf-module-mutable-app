# Create spot request : based on availability , aws will grant EC2
resource "aws_spot_instance_request" "spot" {
  count                 = var.SPOT_INSTANCE_COUNT
  ami                   = data.aws_ami.ami.id
  instance_type         = var.INSTANCE_TYPE
  wait_for_fulfillment  = true

  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}
