include_recipe 'python'

directory node['python']['venv_dir'] do
  mode '0775'
  owner 'root'
  group 'root'
  recursive true
end


python_virtualenv node['python']['venv_dir'] do
  owner 'root'
  group 'root'
  action :create
end

%w{libcrack2-dev libpq-dev libcurl4-openssl-dev python-dev libevent-dev}.each do |pkg|
  package pkg do
      action :install
  end
end

node['django']['python']['packages'].each do |pkg, version|
  python_pip pkg.to_s do
      version version
      virtualenv node['python']['venv_dir']
   end
end


python_pip "Distribute" do
  action :install
  end

python_pip "supervisor" do
    action :upgrade
end
