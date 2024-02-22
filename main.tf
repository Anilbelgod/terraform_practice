provider "google"{

  project = "gradient-prathiksha-20240202"
  zone    = "us-central1-a"
}

resource "google_compute_network" "import-network"{
    name="importvm-network"
    auto_create_subnetworks = true
}


resource "google_compute_instance" "import-vm"{
    name         = "import-test-vm"
    machine_type = "f1-micro"
  

   boot_disk {
    initialize_params {
      image = "debian-12-bookworm-v20240213"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "importvm-network"

    access_config {
      // Ephemeral public IP
    }
  }


}