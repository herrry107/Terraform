# import

import.tf
<pre><code>
resource "aws_instance" "my_new_instance" {
	ami = "unknown"
	instance_type = "unknown"
}
</code></pre>

<pre><code>terraform init</code></pre>

terraform import command
<pre><code>
terraform import aws_instance.my_new_instance instance-id
terraform state list
terraform state show aws_instance.my_new_instance
</code></pre>


