#!/bin/bash
DBFILTER="(performance_schema|information_schema|tmp)";
MBD="${BACKUPPC_PRE_DUMP}/mysql-dumps";
LOG="${BACKUPPC_HOME}/log/mysql_dumps.log";

#---- FUNC -----
logger() {
    touch $LOG
    TIME="$(date +"%d-%m-%Y, %H:%m")"
    if [ "$1" == "start" ];
    then
	# FILE LOG
	echo -e "\n********************************" >> $LOG
	echo "* Start $TIME" >> $LOG;
	echo "**********************************" >> $LOG
	
	# SCREEN LOG
	echo -e "\n*******************************";
	echo "* Start $TIME";
	echo "*********************************";
    elif [ "$1" == "end" ];
    then echo "* End $TIME" >> $LOG
    else
        echo "$1"
	echo "$1" >> $LOG
    fi
}


#---- MAIN ----

if [ -z "$BACKUPPC_PRE_DUMP" ]; then
    echo please use 'pre_backup' to start
    exit
fi
MYSQLDUMP="$(which mysqldump) --opt";
#-DIRNAME=`date +%Y-%m`;

MYSQL=$(which mysql);
TAR=$(which tar);
GZIP=$(which gzip);
NICE=$(which nice);
EGREP=$(which egrep);

#---- START ----
mkdir -p "$MBD";
logger "start";

if [ "$DBS" != "" ] && [ "$MBD" != "" ] && [ "$MBD" != "/" ] && [ -r "$MBD" ];
then
    logger "Purging $MBD directory";
    rm $MBD/*.gz;
fi

#-DBS=$($MYSQL -u $DUMP_USER -p"$DUMP_PASS" -Bse "show databases");
DBS=$($MYSQL -Bse "show databases");

logger "Dumping Mysql-Databases:"
logger "Saving to... '$MBD'"

for db in $DBS
do
    if !(echo $db | $EGREP $DBFILTER > /dev/null);
    then
        FILENAME="$db-`date +%Y_%m_%d_%H_%M_%S`.sql.gz";
#-        echo $FILENAME
        logger "Saving $FILENAME"
#-	$NICE -n 20 $MYSQLDUMP -u $DUMP_USER -p"$DUMP_PASS" $db | $NICE -n 20 $GZIP -c > "$MBD/$FILENAME";
	$NICE -n 20 $MYSQLDUMP --databases $db | $NICE -n 20 $GZIP -c > "$MBD/$FILENAME";
    fi
done

logger "Dump done!";
logger "end";
#-if [ -d $LOG ]; then
#-    gzip -9f $LOG
#-fi
