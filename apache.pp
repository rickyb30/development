case $operatingsystem{

centos,redhat:{
$service_name=’httpd’,
$conf_file=’httpd.conf’,
$package_name=’httpd’,
$conf_path=’/etc/httpd/conf.d/httpd.conf’,
}
ubuntu,debian:{
$service_name=’apache2',
$conf_file=’apache2.conf’,
$package_name=’apache2',
$conf_path=’/etc/apache2/apache2.conf’,
}

}

package{‘apache’:
name => $package_name,
ensure => installed,

}

service{‘apache’:
name => $service_name,
ensure => running,
enable => true,
subscribe => File['apache.conf'],

}

file{‘apache.conf’:
path => $conf_path,
source => “/files/${conf_file}”,
ensure => file,
require => Package[$package_name],

}

Note: Please make appropriate changes for the source attribute under file resource.