bind_addr="0.0.0.0"

advertise {
    http = "{{ ansible_ssh_host }}"
    rpc = "{{ ansible_ssh_host }}"
    serf = "{{ ansible_ssh_host }}"
}

data_dir="/tmp/nomad"

client {
  enabled = true
  servers = [ {% for host in groups['masters'] %}"{{ hostvars[host]['ansible_ssh_host'] }}"{% if not loop.last %}, {% endif %}{% endfor %} ]
}