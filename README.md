# Default Hardening

### Implemented Rules and Playbooks

1. Before running any file in this repository, make sure to have Python 2.7 installed on your local machine
2. Then you can run `sh prepare-ansible.sh` to install ansible on your local and the specified remote environment
3. Now you can open the `hosts` file to find an overview of all servers in their different environments
4. ansible-playbook setup.yml -i hosts --extra-vars "server_environment=development"

You can specify the hosts group that you want to bulk setup on line 1 of setup.yml
