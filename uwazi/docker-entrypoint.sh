#!/bin/bash
set -e
# evaluate first run or not first run
DB_URL="mongodb://$DBHOST:27017"
DB_DOES_NOT_EXISTS=$(mongosh --quiet $DB_URL --eval "db.getMongo().getDBNames().indexOf('$DATABASE_NAME') == -1"
if [ $DB_DOES_NOT_EXISTS == "true" ]; then
	echo "uwazi-docker: MongoDB and Elastic Search have not been initialized yet."
	# NODE_ENV=production yarn blank-state ${DATABASE_NAME}
	yarn blank-state ${DATABASE_NAME}
fi
# RUN mkdir -p ./uwazi/log ./uwazi/uploaded_documents ./uwazi/custom_uploads ./uwazi/temporal_files
# DATABASE_NAME=my_db_name INDEX_NAME=my_db_name NODE_ENV=production FILES_ROOT_PATH=/xxxx/yyyy/uwazi/ node server.js
exec node server.js
