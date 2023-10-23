FROM node:18 as BUILD

WORKDIR /public
COPY ./public /public
RUN npx -p less lessc /public/less/index.less /public/css/index.css && \
    npx -p clean-css-cli cleancss /public/css/index.css -o /public/css/index-min.css && \
    mv /public/css/index-min.css /public/css/index.css

FROM gitea/gitea:1.13

ENV GITEA_CUSTOM=/custom

COPY --from=BUILD /public /custom/public
COPY ./options /custom/options
COPY ./templates /custom/templates
