provider "tls" {}
resource "tls_private_key" "t" {
    algorithm = "RSA"
}
resource "aws_key_pair" "test" {
    key_name   = "task1-key"
    public_key = "${tls_private_key.t.public_key_openssh}"
}
provider "local" {}

resource "local_file" "key" {
    content  = "${tls_private_key.t.private_key_pem}"
    filename = "task1-key.pem"
       
}
