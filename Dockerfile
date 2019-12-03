FROM node:6-stretch
LABEL Prototyp version: 0.1

ENV FONTSTACK_PASSWORD ""
ENV CROATIA_OTP_URL https://api.cityrouting.e-gpp.hr/routing/v1/routers/croatia/index/graphql
ENV WORK=/opt/hsl-map-server
ENV NODE_OPTS ""

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y git unzip pngquant libgl1-mesa-glx libgl1-mesa-dri xserver-xorg-video-dummy libgles2-mesa libstdc++6 xorg openbox

RUN mkdir -p ${WORK}
WORKDIR ${WORK}

COPY yarn.lock ${WORK}
COPY package.json ${WORK}
RUN yarn install

COPY . ${WORK}

# Download mbtiles manually to avoid burning bandwidth
# RUN curl https://digitransit.sfo2.digitaloceanspaces.com/croatia.mbtiles > croatia.mbtiles
EXPOSE 8080

RUN chmod -R 777 ${WORK}

RUN mkdir /.forever && chmod -R 777 /.forever
#USER 9999

ADD run.sh /usr/local/bin/


CMD /usr/local/bin/run.sh
