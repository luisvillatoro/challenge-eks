Hi There, this repos is meant to be for deploying a k8s cluster in AWS EKS using terraform and deploying and a little Node application, we are going to use a lot of technologies to accomplish the objective and I'm going to explain to you step by step on how to do it.

First step:

You'll need to install in your computer the following tools:

- AWS CLI, here you have the link to install it in different OS (Mac, Linux or Windows): https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- Terraform, here you have the link to install it in different OS (Mac, Linux or Windows): https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
- Kubectl, here you have the link to install it in different OS (Mac, Linux or Windows): https://kubernetes.io/docs/tasks/tools/
- Helm, here you have the link to install it in different OS (Mac, Linux or Windows): https://helm.sh/docs/intro/install/

Once that you installed the tools now we can proceed with the next step step:

Second step:

Configure AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY in your local environment, so that type the commands below:

$aws iam create-access-key --user-name MyUser // Used to create the ACCESS KEY and SECRET ACCESS KEY you should see something like this:

![image](https://github.com/luisvillatoro/cactus-challenge/assets/32403184/15425fdb-6c7e-41fc-a02e-1843b12dab64)

Keep the access key and secret, then type the command below.


$aws configure // This command is going to request you the two variables above and you will see something like in the image below:


![image](https://github.com/luisvillatoro/cactus-challenge/assets/32403184/4c76f710-3ee3-4583-a309-432c7d0467c8)

Third step:

Now that you have your credentials configured, you can clone the repo in you computer and navigate to /terrafom folder and type the commands below:

$terraform plan // This will show you the resources that Terraform is going to create so you can review it, once you see that everything is fine type:

$terraform apply // This command is going to deploy all the resources mentioned in the plan. (It might take several minutes to deploy all the resources)

Once the apply is completed you´ll need to write down the outputs of the apply and give yourself access to the cluster with the command:

$ aws eks update-kubeconfig --name $cluster-name // This command will give you access to the cluster with Kubectl within the terminal

Now you can check if you have access to the cluster with the command:

$kubectl get nodes // You should see something like this

<img width="515" alt="image" src="https://github.com/luisvillatoro/cactus-challenge/assets/32403184/d93bfd66-9511-4fc8-9c27-4c12e07d7482">


Fourth step:

Install ArgoCD, for this step you can simply navigate to /argocd/charts and there you will see a bash script named install-argocd.sh give it execute permission with $chmod 744 install-argocd.sh, and run it, this command is going to install ArgoCD to your cluster in the namespace of argocd.

Once the ArgoCD is installed in your cluster you need to access the GUI for this you should type the following command to obtain the password:

$kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d // The default user is admin.

Now that we have the credentials, you can perform a port-forwar to access the ArgoCD UI, the command is:

$kubectl -n argocd port-forward svc/argocd-argocd-server 8080:443

