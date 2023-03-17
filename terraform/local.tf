resource "local_file" "test_file" {
  filename = "${var.basePath}my_local_file"
  content  = "This is first local file"
}

resource "local_file" "test_file1" {
  filename = "${var.basePath}my_local_file2"
  content  = "${var.defaultContent}. Id of first file is ${local_file.test_file.id}"
}
