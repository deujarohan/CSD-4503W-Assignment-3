# Base Image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your files to nginx html folder
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY image.jpg /usr/share/nginx/html/

# Update nginx to listen on port 8085
RUN sed -i 's/listen       80;/listen       8085;/g' /etc/nginx/conf.d/default.conf

# Expose port 8085
EXPOSE 8085

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]