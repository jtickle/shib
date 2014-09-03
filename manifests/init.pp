{
  "name": "jtickle/shib",
  "version": "0.1.0",
  "author": "Jeff Tickle",
  "summary": "Handles Shibboleth SPs and IDPs",
  "license": "Apache 2.0",
  "source": "github.com/jtickle/shib",
  "issues_url": "https://github.com/jtickle/shib/issues",
  "project_page": "https://github.com/jtickle/shib",
  "dependencies": [
    {
      "name": "puppetlabs-stdlib",
      "version_range": ">= 1.0.0"
    }
  ]
}

[root@jester shib]# cat Rakefile 
require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp"]

desc "Validate manifests, templates, and ruby files"
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end
[root@jester shib]# vim README.md 
[root@jester shib]# ls
manifests  metadata.json  Rakefile  README.md  spec  tests
[root@jester shib]# cd manifests/
[root@jester manifests]# ls
init.pp
[root@jester manifests]# cat init.pp 
# == Class: shib
#
# Full description of class shib here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { shib:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class shib {


}
