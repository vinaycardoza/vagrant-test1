import 'java6.pp'
import 'wso2as.pp'

node default {
	class { 'java': version => '6u45-0~webupd8~8', }

	file { "/etc/profile.d/set_java6_home.sh":
		ensure => present,
		source => '/vagrant/set_java6_home.sh',
          	require => [ Class['java']],
   	}

   	class {
   		'wso2as':
   			file => '/vagrant/wso2/wso2as-5.2.1.zip',
   			require => [ File['/etc/profile.d/set_java6_home.sh'] ]
   	}

	class { 'postgresql::server': }

	include solr
}
