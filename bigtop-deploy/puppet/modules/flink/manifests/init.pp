# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class flink {

  class deploy ($roles) {
    if ("flink-client" in $roles) {
      include flink::client
    }
  }

  class client {
    package { "flink":
      ensure => latest,
      require => Package["hadoop"],
    }
  }

  file { '/etc/flink/conf/flink-conf.yaml':
	content => template('flink/flink-conf.yaml'),
	require => Package['flink'],
  }
}         
