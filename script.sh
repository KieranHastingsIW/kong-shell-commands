#!/bin/sh
echo hello world
curl -i -X GET \
        --url http://kong:8001/
status=$?
echo  ${status}
while [ ${status} -ne 0 ]
do
    sleep 1
    echo ${status}
       curl -i -X GET --url http://kong:8001/
    status=$?
done   
curl -i -X POST \
--url http://kong:8001/services/ \
--data name=GetAllUsers \
--data 'url=http://hello-world:8080/list'
curl -i -X POST \
--url http://kong:8001/services/GetAllUsers/routes/ \
    -H "Content-Type: application/json" \
    -d '{"name": "bob", "methods":["GET"], "hosts":["localhost"], "paths":["/all"]}'