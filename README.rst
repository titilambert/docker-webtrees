#####################
Webtrees docker image
#####################

Build
#####

make build


Start mysql container
#####################

make mysql

Run
###

make run

Startup script
##############

::

    #!/bin/bash
    
    mkdir -p /var/www/webtrees/data
    chown www-data:www-data -R /var/www/webtrees/data
    
    apache2 -DFOREGROUND

Manual step after startup
#########################

You can run the following command to get webtrees working directly

::

    cat << EOF > /var/www/webtrees/data/config.ini.php
    ; <?php exit; ?> DO NOT DELETE THIS LINE
    dbhost="$MYSQL_HOST"
    dbport="$MYSQL_PORT"
    dbuser="root"
    dbpass="$MYSQL_PASSWORD"
    dbname="webtrees"
    tblpfx="wt_"
    EOF

    echo CREATE DATABASE webtrees | mysql -h mysql -u root -p
