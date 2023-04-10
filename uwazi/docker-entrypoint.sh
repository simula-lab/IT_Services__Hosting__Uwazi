#!/bin/bash
set -e
# evaluate first run or not first run
DB_URL="mongodb://$DBHOST:$DBPORT"
DB_DOES_NOT_EXISTS=$(mongo --quiet $DB_URL --eval "db.getMongo().getDBNames().indexOf('$DATABASE_NAME') == -1")
if [ $DB_DOES_NOT_EXISTS == "true" ]; then
	echo "uwazi-docker: MongoDB and Elastic Search have not been initialized yet."
	# NODE_ENV=production yarn blank-state ${DATABASE_NAME}
	yarn blank-state
fi

node server.js
