provider "google" {
	credentials = "${file("account.json")}"
	project = "my-portfolio-231423"
	region = "us-central1"
	zone = "us-central1-b"
}

resource "google_compute_instance" "vm_instance" {
	name = "ml-pipeline-test"
	machine_type = "f1-micro"

	boot_disk {
		initialize_params {
			image = "ml-pipeline"
		}
	}

	network_interface {
		network = "default"
		access_config = {
		}
	}

	metadata_startup_script = "python serving/tensorflow_serving/example/mnist_saved_model.py --training interation 10 --model_version=4 ~/tmp/mnist/test"
}

output "Creating model!" {
	value = "ls ~/tmp/mnist/test"
}
