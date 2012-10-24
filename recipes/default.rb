#
# Cookbook Name:: newrelic-sysmond
# Recipe:: default
#
# Copyright 2012, Nosto Solutions Ltd
# Authors:
#       Jani Luostarinen <jani.luostarinen@nosto.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "newrelic-sysmond::newrelic_repo"

package "newrelic-sysmond" do
  action :upgrade
end

execute "nrsysmond-config-license_key" do
  command "nrsysmond-config --set license_key=#{node['newrelic']['license_key']}"
  action :run
end

execute "nrsysmond-config-ssl" do
  command "nrsysmond-config --set ssl=#{node['newrelic']['ssl']}"
  action :run
end

service "newrelic-sysmond" do
  supports :restart => true, :status => true
  action [:enable, :start]  
end