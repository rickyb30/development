class mysql-server {
$password = “insert_password_here”
package { “MySQL-client”: ensure => installed }
package { “MySQL-server”: ensure => installed }
package { “MySQL-shared”: ensure => installed }

exec { “Set MySQL server root password”:
subscribe => [ Package["MySQL-server"], Package["MySQL-client"], Package["MySQL-shared"] ],
refreshonly => true,
unless => “mysqladmin -uroot -p$password status”,
path => “/bin:/usr/bin”,
command => “mysqladmin -uroot password $password”,
}
}