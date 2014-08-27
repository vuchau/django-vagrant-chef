include_recipe 'postgresql::server'
include_recipe 'postgresql::client'

pg_user node['django']['postgresql']['user'] do
  privileges superuser: true, createdb: true, login: true
  password node['django']['postgresql']['password']
end

pg_database node['django']['postgresql']['database'] do
  owner node['django']['postgresql']['user']
  encoding node['django']['postgresql']['encoding']
  template 'template0'
  locale 'en_US.UTF8'
end
