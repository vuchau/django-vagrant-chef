include_recipe 'supervisor'

#supervisor_service 'djangoapp' do
#  command 'echo hi'
#  #command    node['python']['venv_dir'] +  'bin/python ' +  node['django']['app']['project_home'] + '/manage.py runserver 0.0.0.0:' +  node['django']['app']['port'] + ' --settings=' + node['django']['app']['settings'] +  '--noreload'
#  user 'root'
#  #action :enable
#
#end  
