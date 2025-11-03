  sudo podman exec -it terraform-enterprise-terraform-enterprise tfectl admin token --url

curl -kg \
--header "Content-Type: application/json" \
--request POST \
--data @/etc/tfe_initial_user.json \
https://tftest.guy.sbx.hashidemos.io/admin/account/new?token=391ad31a26c7cccc2484ec3aea071782231486bdb79894d97bc32bff5af949ba | tee /etc/tfe_initial_user_output.json
      
TOKEN=`jq -e -r .token /etc/tfe_initial_user_output.json` [[ $? -eq 0 && "$TOKEN" ]] || exit 1
  

  sudo podman exec -it terraform-enterprise-terraform-enterprise tfectl admin token

  sudo podman exec -it terraform-enterprise-terraform-enterprise supervisorctl status

sudo podman exec -it terraform-enterprise-terraform-enterprise /usr/local/bin/supervisord-run

  cat /var/log/terraform-enterprise/tfe:task-worker.log