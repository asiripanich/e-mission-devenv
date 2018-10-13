docker stop emp
docker rm emp
docker build -t e-mission-phone:latest .
docker run -d \
  -p 3000:3000 \
  --name=emp \
  --net="e-mission-server" \
  --ulimit nofile=98304:98304 \
  e-mission-phone:latest
