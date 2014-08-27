default['django']['app']['settings'] = 'settings'
default['django']['app']['pythonpath'] = nil


# Postgresql Overrides
default['django']['postgresql']['database'] = 'django'
default['django']['postgresql']['user'] = 'django_test'
default['django']['postgresql']['password'] = 'django_test'
default['django']['postgresql']['encoding'] = 'UTF-8'

default['postgresql']['pg_hba'] = [
    { "type" => "local", "db"=> "all" , "user"=> "postgres",   "addr" => "", "method" => "ident" },
    { "type" => "local",  "db"=> "all", "user" => node['django']['postgresql']['user'] ,  "method" => "md5" }
 ]
