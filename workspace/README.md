# workspace

In Terraform, a workspace is an isolated instance of your Terraform state. Workspaces are primarily used to manage multiple environments (like dev, staging, and prod) within the same Terraform configuration, without needing to duplicate code.

show all workspace
<pre><code>
terraform workspace list
#default
</code></pre>

show state list in default workspace
<pre><code>terraform state list</code></pre>
![state list](https://github.com/herrry107/Terraform/blob/main/images/state_list1.png)

create new workspace
<pre><code>
#dev is workspace name
terraform workspace new dev
</code></pre>

show state list in dev workspace
<pre><code>terraform state list</code></pre>
![state list](https://github.com/herrry107/Terraform/blob/main/images/state_list2.png)


switch to workspace
<pre><code>
terraform workspace select default
</code></pre>


