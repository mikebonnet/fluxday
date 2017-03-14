FROM registry.access.redhat.com/rhscl/ror-42-rhel7:latest

LABEL maintainer Mike Bonnet <mikeb@redhat.com>

ENV LANGUAGE en_US.UTF-8
ENV APP_HOME $HOME/fluxday

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN scl enable rh-ror42 "bundle install"
COPY . $APP_HOME
RUN mkdir -m 777 tmp

EXPOSE 3000

ENTRYPOINT ["scl", "enable", "rh-ror42", "rails server"]
