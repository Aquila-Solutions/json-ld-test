clear
docker compose up -d
while ! docker logs $(docker ps -q -f "name=ldes-server$") 2> /dev/null | grep 'Started Application in' ; do sleep 1; done
curl -X POST -H "content-type: text/turtle" "http://localhost:9003/admin/api/v1/eventstreams" -d "@./definitions/occupancy.ttl"
curl -X POST -H "content-type: text/turtle" "http://localhost:9003/admin/api/v1/eventstreams/occupancy/views" -d "@./definitions/occupancy.by-page.ttl"

docker compose up test-message-generator -d
