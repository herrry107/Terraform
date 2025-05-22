# workspace

In Terraform, a workspace is an isolated instance of your Terraform state. Workspaces are primarily used to manage multiple environments (like dev, staging, and prod) within the same Terraform configuration, without needing to duplicate code.

show all workspace
<pre><code>
terraform workspace list
#default
</code></pre>

create new workspace
<pre><code>
#dev is workspace name
terraform workspace new dev
</code></pre>

switch to workspace
<pre><code>
terraform workspace select default
</code></pre>


