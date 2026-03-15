FROM nginx:alpine
COPY . /tmp/app/
RUN if [ -d /tmp/app/html ] && [ -f /tmp/app/html/index.html ]; then \
      cp -r /tmp/app/html/. /usr/share/nginx/html/; \
    else \
      find /tmp/app -maxdepth 1 -name '*.html' -exec cp {} /usr/share/nginx/html/ \; ; \
    fi
EXPOSE 80