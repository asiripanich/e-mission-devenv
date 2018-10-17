docker run -d \
  -p 13000:3000 \
  --name=ems-phone \
  --net="ems" \
  --ulimit nofile=98304:98304 \
  e-mission-phone:latest
