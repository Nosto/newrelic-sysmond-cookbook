name             "newrelic-sysmond"
maintainer       "Jani Luostarinen"
maintainer_email "jani.luostarinen@nosto.com"
license          "Apache 2.0"
description      "Installs newrelic-sysmond"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.3"

recipe "newrelic-sysmond::default", "Installs and configures newrelic-sysmond"
recipe "newrelic-sysmond::newrelic_repo", "Setups New Relic apt-repo"

depends "apt"

%w{ debian ubuntu }.each do |os|
  supports os
end
