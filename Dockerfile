FROM klakegg/hugo:ext-alpine-onbuild as hugo

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html