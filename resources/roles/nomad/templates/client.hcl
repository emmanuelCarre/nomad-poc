data_dir="/tmp/nomad"

client {
  enabled = true
  servers = [ {% for host in groups['masters'] %}"{{ hostvars[host]['ansible_ssh_host'] }}"{% if not loop.last %}, {% endif %}{% endfor %} ]
}