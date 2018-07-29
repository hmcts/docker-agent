FROM hmcts/cnp-aks-client:1.1

RUN apk update && apk add --no-cache \
  nodejs-npm openjdk8 maven git yarn docker curl \
  && npm install npm@latest minimatch@latest graceful-fs@latest -g \
  && npm install --global gulp eslint \
  && curl https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip -o /tmp/terraform_0.11.7_linux_amd64.zip \
  && unzip -d /usr/bin /tmp/terraform_0.11.7_linux_amd64.zip \
  && rm -f /tmp/terraform_0.11.7_linux_amd64.zip

ENV LANG C.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin