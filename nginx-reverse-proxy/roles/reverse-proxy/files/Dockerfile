FROM nginx:1.21

# Copy custom nginx configs
COPY common.conf /etc/nginx/
COPY common_location.conf /etc/nginx/
COPY ssl.conf /etc/nginx/
COPY nginx.conf /etc/nginx/
COPY dhparams.pem /etc/nginx/

# copy SSL certs
COPY cert.crt /etc/ssl/private
COPY cert.key /etc/ssl/private