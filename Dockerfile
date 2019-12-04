FROM node:6-stretch
LABEL Prototyp version: 0.1

ENV CROATIA_OTP_URL api.cityrouting.e-gpp.hr/routing/v1/routers/croatia/index/graphql
ENV WORK=/opt/hsl-map-server

RUN mkdir -p ${WORK}
WORKDIR ${WORK}

COPY yarn.lock ${WORK}
COPY package.json ${WORK}
RUN yarn install

COPY . ${WORK}

EXPOSE 8080

RUN chmod -R 777 ${WORK}

RUN mkdir /.forever && chmod -R 777 /.forever
#USER 9999

ADD run.sh /usr/local/bin/


CMD /usr/local/bin/run.sh
