#
# Cookbook Name:: newrelic-sysmond
# Recipe:: newrelic_repo
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

include_recipe "apt"

case node['platform']
when "debian", "ubuntu"
  execute "apt-get update" do
    action :nothing
  end

  apt_repository "newrelic" do
    uri "http://apt.newrelic.com/debian/"
    distribution "newrelic"
    components ["non-free"]
    keyserver "keyserver.ubuntu.com"
    key "548C16BF"
    action :add
    notifies :run, "execute[apt-get update]", :immediately
  end

else
    Chef::Log.warn("Adding the #{node['platform']} newrelic repository is not yet not supported by this cookbook")
end
