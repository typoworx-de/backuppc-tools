HOW TO USE THIS SCRIPT
======================


1)	Install requirements:
	apt-get install sudo rsync

	I assume mysql-server and mysql-client are already installed!

2)	Extract/move this to:
	/usr/local/backuppc/

3)	Create a user-account "backuppc"
	with SSH-Authentication and use "/usr/local/backuppc" as HOME-DIR!

	$> useradd -r -M -d /usr/local/backuppc backuppc


	I recommend using the user "backuppc" on both - server and client
	machine. Make shure you apply the public-key for passwordless
	authentication on the user's home "backuppc" and not on root!

	TRY THIS:
	$> ssh-copy-id -i ~/.ssh/id_rsa.pub backuppc@[client-machine-host-or-ip]

	OR MANUALLY create & append the public-key to:
	$> /usr/local/backuppc/.ssh/.authorized_keys2

	follow this link if you need help:
	https://www.debian-administration.org/article/530/SSH_with_authentication_key_instead_of_password


4)	$> chown backuppc:root /usr/local/backuppc/


5)	$> mv ./suders.sudo /etc/sudoers.d/
	$> chown root:root /etc/suders.d/backupc.sudo
	$> chmod 0440 /etc/suders.d/backupc.sudo

	This is needed to allow the non-root user "backuppc" to
	execute tar/rsync with root-privileges!

	This also secures your root env preventing any faulties while
	automatically processing something on the machine the backup is
	created for.

6.1)	Create a mysql user "backuppc" with
	strong password.

	Use privileges only for global access:
	SELECT, SHOW TABLES, LOCK TABLES

	Write-Privileges are NOT REQUIRED!

6.2)	Enter mysql credentials in /usr/local/backuppc/.my.cnf


7)	Don't forget to test passwordless login!

7.1)	if you use "backuppc" on the backup-machine, too:

	$> su "backuppc" && ssh backuppc@[client-machine-host-or-ip]

7.2)	if you gave root the privilege to remotely login passwordless,
	simply execute this as user root:

	$> ssh backuppc@[client-machine-host-or-ip]


8)	manually execute the backup-script:

	$> /usr/local/backuppc/bin/pre_backup



9)	If everything run's fine, setup your automatic environment.
	BackupPC is recommended. For every other software make shure
	your backup-server executes this script every time before
	starting to backup!


10)	If you have any ideas for improvements, suggest to let me know ;-)

	Suggest to donate and sponsor my work if you like it!


	-----------------------------------------------------------------
	Donate using...

	=========================		=========================
	Bitcoin (prefered!)			Paypal
	=========================		=========================


	BTC-Address				E-Mail Address
	19rpBxcaq51Q8DrT64Pp8knBWtZUzfXD15	donate@1stblog.de

	-----------------------------------------------------------------
