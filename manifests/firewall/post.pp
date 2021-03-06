#
# Copyright (C) 2014 eNovance SAS <licensing@enovance.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# == Class: cloud::firewall::post
#
# Firewall rules during 'post' Puppet stage
#
class cloud::firewall::post(
  $debug             = false,
  $firewall_settings = {},
){

  if $debug {
    warning('debug is enabled, the traffic is not blocked.')
  } else {
    firewall { '998 log all':
      proto => 'all',
      jump  => 'LOG',
    }
    cloud::firewall::rule{ '999 drop all':
      proto  => 'all',
      action => 'drop',
      extras => $firewall_settings,
    }
    notice('At this stage, all network traffic is blocked.')
  }

}
