class wso2as($file){
	package {
		'unzip':
			ensure => 'present'
	}

	exec {
		'unzip_wso2as':
			command => "/usr/bin/unzip ${file} -d /opt",
			require => Package['unzip'],

		'start_wso2as':
			command => "/opt/wso2as-5.2.1/bin/wso2server.sh start",
			require => Exec['unzip_wso2as']
	}

}