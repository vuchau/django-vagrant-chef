include_recipe 'postgresql::server'
include_recipe 'postgresql::client'

pg_user node['django_postgresql']['user'] do
  privileges superuser: true, createdb: true, login: true
  encrypted_password node['django_postgresql']['password']
end

pg_database node['django_postgresql']['database'] do
  owner node['django_postgresql']['user']
  encoding 'utf8'
  template 'template0'
  locale 'en_US.UTF8'
end
