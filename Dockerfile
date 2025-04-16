FROM klakegg/hugo:ext-alpine as hugo

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/