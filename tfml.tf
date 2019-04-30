provider "google" {
	credentials = "${file("account.json")}"
	project = "my-portfolio-231423"
	region = "us-central1"
	zone = "us-central1-b"
}

resource "google_compute_instance" "vm_instance" {
	name = "instance-3"
	machine_type = "f1-micro"

	boot_disk {
		initialize_params {
			image = "debian-9-stretch-v20190124"
		}
	}

	network_interface {
		network = "default"
		access_config = {
		}
	}

	metadata_startup_script = "script goes here"
}

output "ip" {
	value = "This is a test IP"
}
