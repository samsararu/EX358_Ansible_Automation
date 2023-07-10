# Create an ansible user
ansible all -m user -a "name=ansible state=present" -u root --ask-pass

# Give privileges to it
ansible all -m copy -a 'content="ansible ALL=(ALL) NOPASSWD: ALL" dest=/etc/sudoers.d/ansible' -u root --ask-pass

# Copy SSH keys
ansible all -m authorized_key -a "user=ansible state=present key=\"{{ lookup(\'file\', \'/home/ansible/.ssh/id_rsa.pub\') }}\"" -u root --ask-pass
