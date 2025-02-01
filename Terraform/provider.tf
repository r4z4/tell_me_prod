provider "oci" {
  region = "us-chicago-1"
}resource "oci_containerengine_cluster" "oke_cluster" {
  compartment_id = var.compartment_id
  name           = "my-oke-cluster"
  kubernetes_version = "v1.27.2"
  vcn_id        = var.vcn_id

}resource "oci_containerengine_node_pool" "oke_node_pool" {
  cluster_id = oci_containerengine_cluster.oke_cluster.id
  compartment_id = var.compartment_id
  name = "my-node-pool"
  node_shape = "VM.Standard.E4.Flex"
  node_config_details {
    size = 1
  }
}
