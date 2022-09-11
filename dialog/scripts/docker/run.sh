# TODO: need a better one
PUB_IP_CURL=https://ipinfo.io/ip
healthcheck(){
    while true; do (echo -e 'HTTP/1.1 200 OK\r\n\r\n 1') | nc -lp 1111 > /dev/null; done
}
# add yryuu
perms_key="-----BEGIN PUBLIC KEY——\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCW/wdQUDgJ1cMcSWjnzFLfr96A\n8ZFGE7ddSbNQm0pB3CFwSZBoVTPPWvYDrf6spI270e61vq++7E4DAYMRU2ErMa/9\nCxtwIVQqHryj11vGuZEfl5AS6/BagusjiAs1jliygDXczmZi5iWUeb6F2RwKiEBf\n4UEHQkJHxuOSNKhgswIDAQAB\n-----END PUBLIC KEY-----"

# add yryuu
#healthcheck &
#echo -e $(echo -e ${perms_key//\n/n}) > /app/certs/perms.pub.pem        
#head -3 /app/certs/perms.pub.pem
export MEDIASOUP_ANNOUNCED_IP=$(curl ${PUB_IP_CURL})
echo "MEDIASOUP_ANNOUNCED_IP: $MEDIASOUP_ANNOUNCED_IP"
export INTERACTIVE=nope

npm start
