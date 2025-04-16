FROM floryn90/hugo:0.146.5-alpine-onbuild as hugo
USER root
RUN chown -R hugo:hugo /src
USER hugo
FROM nginx
COPY --from=hugo /target /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/