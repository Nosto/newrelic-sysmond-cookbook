Description
===========

Installs `newrelic-sysmond` via apt from New Relic repo.

Requirements
============

## Platform:

* Debian/Ubuntu

## Cookbooks:

* apt

Attributes
==========

See `attributes/default.rb` for default values.

* `node['newrelic']['license_key']` -
40-character hexadecimal string provided by New Relic. This is
required in order for the server monitor to start.
* `node['newrelic']['loglevel']` -
Level of detail you want in the log file (as defined by the logfile setting below. Valid values are (in increasing levels of verbosity):
  * error        - show errors only
  * warning      - show errors and warnings
  * info         - show minimal additional information messages
  * verbose      - show more detailed information messages
  * debug        - show debug messages
  * verbosedebug - show very detailed debug messages
* `node['newrelic']['logfile]` -
Name of the file where the server monitor will store it's log
messages. The amount of detail stored in this file is controlled
by the loglevel option (above).
* `node['newrelic']['proxy']` -
The name and optional login credentials of the proxy server to use
for all communication with the New Relic collector. In its simplest
form this setting is just a hostname[:port] setting. The default
port if none is specified is 1080. If your proxy requires a user
name, use the syntax user@host[:port]. If it also requires a
password use the format user:password@host[:port]. For example:
fred:secret@proxy.mydomain.com:8181
* `node['newrelic']['ssl']` -
If you prefer the daemon to use the secure HTTP (https) protocol
when communicating with the New Relic collector servers, set this
to true.
* `node['newrelic']['ssl_ca_bundle']` -
Sets the location of a file containing CA certificates in PEM
format. When set, the certificates in this file will be used
to authenticate the New Relic collector servers. If ssl_ca_path
is also set (see below), the certificates in this file will be
searched first, followed by the certificates contained in the
ssl_ca_path directory. This setting has no effect when ssl
is set to false.
* `node['newrelic']['ssl_ca_path']` -
Sets the location of a directory containing trusted CA certificates
in PEM format. When set, the certificates in this directory will be
used to authenticate the New Relic collector servers. If
ssl_ca_bundle is also set (see above), it will be searched first
followed by the certificates contained in ssl_ca_path. This
setting has no effect when ssl is set to false.
* `node['newrelic']['pidfile']` -
Name of a file where the server monitoring daemon will store it's
process ID (PID). This is used by the startup and shutdown script
to determine if the monitor is already running, and to start it up
or shut it down.
* `node['newrelic']['collector_host']` -
The name of the New Relic collector to connect to. This should only
ever be changed on advise from a New Relic support staff member.
The format is host[:port]. Using a port number of 0 means the default
port, which is 80 (if not using the ssl option - see below) or 443
if SSL is enabled. If the port is omitted the default value is used.

* `node['newrelic']['labels']` -
A series of label_type/label_value pairings
Each item in the pair is separated by a colon
Each pair is separated by a semicolon
e.g. labels = Environment:Production;DataCenter:EastUS;

Recipes
=======

default
-------

Include the default recipe in a run list, to get `newrelic-sysmond` from New Relic repo.

License and Author
==================

Author:: Jani Luostarinen (<jani.luostarinen@nosto.com>)

Copyright:: 2012, Nosto Solutions, Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
