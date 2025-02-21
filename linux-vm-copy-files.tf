resource "time_sleep" "wait_before_scripts" {

    depends_on = [aws_eip_association.linux-eip-association]
    
    create_duration = "60s"
}

resource "terraform_data" "copyscripts" {

    depends_on = [time_sleep.wait_before_scripts]

    connection {
        type = "ssh"
        host = "${aws_eip.linux-eip.public_ip}"
        user = "ubuntu"
        private_key = file("${aws_key_pair.key_pair.key_name}.pem")
    }

        provisioner "file" {
            source      = "./scripts"
            destination = "."
        }

        provisioner "remote-exec" {
            inline = [
            "chmod u+x ./scripts/*.sh",
            "./scripts/install_reqs.sh ${var.time_zone}",
            "./scripts/create_users.sh ${random_string.password.result}",
            "./scripts/create_desktop_shortcuts.sh"
            ]
        }

}