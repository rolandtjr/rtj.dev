FROM floryn90/hugo:ext-alpine-ci as hugo

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/