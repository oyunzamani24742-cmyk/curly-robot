FROM nginx:alpine

RUN echo 'server {' > /etc/nginx/conf.d/default.conf && \
    echo '    listen 80;' >> /etc/nginx/conf.d/default.conf && \
    echo '    server_name _;' >> /etc/nginx/conf.d/default.conf && \
    echo '    root /usr/share/nginx/html;' >> /etc/nginx/conf.d/default.conf && \
    echo '    index ubuntu.html debian.html index.html;' >> /etc/nginx/conf.d/default.conf && \
    echo '    add_header Cross-Origin-Embedder-Policy "require-corp" always;' >> /etc/nginx/conf.d/default.conf && \
    echo '    add_header Cross-Origin-Opener-Policy "same-origin" always;' >> /etc/nginx/conf.d/default.conf && \
    echo '    location / { try_files $uri $uri/ =404; }' >> /etc/nginx/conf.d/default.conf && \
    echo '}' >> /etc/nginx/conf.d/default.conf

COPY . /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
