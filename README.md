# tf-module-mutable-app

If new Nexus EC2 created then change Pvt IP in - ansible > roles > common > tasks >download-from-nexus.yml and in cart > Jenkinsfile > env.NEXUS_URL="pvt_ip_of_nexus"
also in common.groovy