# django-vagrant-chef #

Chef recipes to provisioning a vagrant workstation with chef


## Vagrant plugins ##

Install the next vagrant plugins before provisioning your box:

* vagrant plugin install vagrant-omnibus  
* vagrant plugin install vagrant-librarian-chef


## Roles ##
The *django* role run all the recipes required to deploy a django devbox, you will need to add 
it to the vagrant configuration:

```ruby


....

config.vm.provision "chef_solo" do |chef|
    ...

    chef.add_role('django')

    ...
end

....

```


## Cookbooks ##

### Base ###

Install packages required to setup a django debian box, you don't need setup special 
attributes


### Django ###

Recipes that install postgresql, python and supervisor


#### Attributes ####

The next attributes has to be defined to install python and virtualenv configuration:

``
['python']['install_method'] = 'package'
['python']['venv_dir'] = '/svr/env/'
``

The next postgresql attributes has to be defined to install django postgresql

``
['django][postgresql']['database'] = ''
['django][postgresql']['user'] = ''
['django][postgresql']['password'] = ''
``

The next postgresql attributes has to be defined to install python package at virtualenv

``
['django']['python']['packages'] = ["ipdb", "http2"]
``

The next attributes are related to django app:

``
['django']['app']['project_home'] = '/vagrant_data/project'
['django']['app']['settings'] = 'project.settings'
['django']['app']['port'] = '8080'


The next attributes are required by the supervisor cookbook:

``
['supervisor']['inet_username'] = ''
['supervisor']['inet_password'] = ''
``


Vagrantfile configuration
--------------------------
```ruby
config.omnibus.chef_version = :latest
config.librarian_chef.cheffile_dir = '~/src/django-vagrant-chef'

config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "~/src/django-vagrant-chef/cookbooks"
    chef.roles_path = "~/src/django-vagrant-chef/roles"
    chef.data_bags_path = "~/src/YOUR_DIRECTORY/data_bags"
    chef.add_role('django')
end
```





License and Author
==================

- Author:: Manuel Ignacio Franco (<maigfrga@gmail.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
