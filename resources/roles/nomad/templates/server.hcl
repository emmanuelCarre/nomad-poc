bind_addr="{{ ansible_ssh_host }}"

# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/nomad"

# Enable the server
server {
    enabled = true

    # Self-elect, should be 3 or 5 for production
    bootstrap_expect = 3
    retry_join = [ {% for host in groups['masters'] %}"{{ hostvars[host]['ansible_ssh_host'] }}:4648"{% if not loop.last %}, {% endif %}{% endfor %} ]
}