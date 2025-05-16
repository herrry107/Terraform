# Basic Commands

**main.tf**
<pre><code>
resource local_file my_file {
	filename= "automate.txt"
	content= "automate file is created"

}
</code></pre>

**Initialize Directory**
<pre><code>terraform init</code></pre>

**Validate file syntax**
<pre><code>terraform validate</code></pre>

**The terraform plan command is used to create an execution plan in Terraform. It allows you to preview the changes that Terraform will make to your infrastructure before applying them. This helps you understand what will happen without actually making any changes.**

<pre><code>terraform plan</code></pre>

**For apply file**
<pre><code>terraform apply #ask for yes or no</code></pre>
<pre><code>terraform apply -auto-approve #don't ask yes or no</code></pre>

**Delete applied changes**
<pre><code>terraform destroy    #ask yes or no</code>/pre>
<pre><code>terraform destroy -auto-approve #don't ask</code></pre>

**Refresh state**
<pre><code>terraform refresh</code></pre>

now see **terrafrom.tfstate** file

**Show state**
<pre><code>terraform state list</code></pre>

**Remove something from  state**
<pre><code>terraform state rm aws-key-pair.my_key</code></pre>

**if we want removed state again**
<pre><code>terraform import aws-key-pair.my_key key-id-in-aws</code></pre>

