FROM node:18 as BUILD

WORKDIR /less
COPY ./less /less
RUN npx -p less lessc /less/index.less /less/index.css && \
    npx -p clean-css-cli cleancss /less/index.css -o /less/index-min.css

FROM gitea/gitea:1.14

ENV GITEA_CUSTOM=/custom

COPY ./public /custom/public
COPY --from=BUILD /less/index-min.css /custom/public/index.css
COPY ./templates /custom/templates
