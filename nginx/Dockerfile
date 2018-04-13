#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:latest

RUN apt-get update && apt-get install --assume-yes apt-utils

# software-properties-common needed for ppa:nginx/stable
RUN \
  apt-get update && \
  apt-get install -y software-properties-common

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx
  
# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

# Define working directory.
WORKDIR /etc/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Copy nginx.conf to /etc/nginx/nginx.conf
COPY nginx.conf /

# Expose ports.
EXPOSE 80

# Define default command.
CMD ["nginx"]


