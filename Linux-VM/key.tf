resource "tls_private_key" "privatekey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "linuxpemkey" {
  filename = "privatekey.pem"
  content = tls_private_key.privatekey.private_key_pem
  depends_on = [ tls_private_key.privatekey ]
}