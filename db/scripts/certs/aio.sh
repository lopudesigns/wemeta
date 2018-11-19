openssl req -x509 -nodes -days 0 -newkey rsa:2048 -keyout ./key.pem -out ./crt.pem -config gen.conf.filled -sha256
