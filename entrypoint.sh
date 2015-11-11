#!/bin/bash
set -e

# setting TERM to be able to use mc or nano
export TERM=xterm

# a tweak to get mysql root password from mariadb
export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-$MYSQL_ENV_MYSQL_ROOT_PASSWORD}

# install phpmyadmin if not installed

chayka install-pma --db-host mysql

# PMA_DIR=/usr/share/phpmyadmin

# if [ ! -d $PMA_DIR ]; then
# 	wget -q -O phpmyadmin.zip https://github.com/phpmyadmin/phpmyadmin/archive/STABLE.zip >> /dev/null && \
#   	unzip phpmyadmin.zip >> /dev/null && \
#   	mv phpmyadmin-STABLE $PMA_DIR && \
#   	cp "$PMA_DIR/config.sample.inc.php" "$PMA_DIR/config.inc.php"

#   	PMA_DB_PASSWORD="$(pwgen -cn 16 1)"

#   	uncomment() {
# 		sed -ri "s/\/\/\s\$cfg\['Servers'\]\[\$i\]\['$1'\]/\$cfg['Servers'][\$i]['$1']/" "$PMA_DIR/config.inc.php"
#   	}

# 	set_config() {
# 		key="$1"
# 		value="$2"
# 		sed -ri "s/\['$key']\s*=\s*'[^']*'/['$key'] = '$value'/" "$PMA_DIR/config.inc.php"
# 	}
	
# 	uncomment 'controlhost'
# 	uncomment 'controlport'
# 	uncomment 'controluser'
# 	uncomment 'controlpass'

# 	set_config 'blowfish_secret' "$(pwgen -cn 16 1)"
# 	set_config 'host' "mysql"
	
# 	set_config 'controlhost' "mysql"
# 	set_config 'controlport' "3306"
# 	set_config 'controluser' "pma"
# 	set_config 'controlpass' "$PMA_DB_PASSWORD"

# 	uncomment 'pmadb'
# 	uncomment 'bookmarktable'
# 	uncomment 'relation'
# 	uncomment 'table_info'
# 	uncomment 'table_coords'
# 	uncomment 'pdf_pages'
# 	uncomment 'column_info'
# 	uncomment 'history'
# 	uncomment 'table_uiprefs'
# 	uncomment 'tracking'
# 	uncomment 'userconfig'
# 	uncomment 'recent'
# 	uncomment 'favorite'
# 	uncomment 'users'
# 	uncomment 'usergroups'
# 	uncomment 'navigationhiding'
# 	uncomment 'savedsearches'
# 	uncomment 'central_columns'
# 	uncomment 'designer_settings'
# 	uncomment 'export_templates'

# 	chayka-create-pma-db "$PMA_DB_PASSWORD"

#   	# echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections && \
# 	# echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYSQL_ROOT_PASSWORD" | debconf-set-selections && \
# 	# echo "phpmyadmin phpmyadmin/mysql/app-pass password pm$MYSQL_ROOT_PASSWORD"| debconf-set-selections && \
# 	# echo "phpmyadmin phpmyadmin/app-password-confirm password pm$MYSQL_ROOT_PASSWORD" | debconf-set-selections
# 	# echo "phpmyadmin phpmyadmin/remote/newhost  string $MYSQL_PORT_3306_TCP_ADDR" | debconf-set-selections && \
# 	# DEBIAN_FRONTEND=noninteractive apt-get install -my mysql-server mysql-client phpmyadmin
# fi

# fix phpmyadmin config file
#sed -i "s/dbserver='[^']*';/dbserver='$MYSQL_PORT_3306_TCP_ADDR'/" /etc/phpmyadmin/config-db.php


exec "$@"