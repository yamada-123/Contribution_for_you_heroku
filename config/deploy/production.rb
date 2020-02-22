server '18.180.34.62', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/sy/.ssh/id_rsa'