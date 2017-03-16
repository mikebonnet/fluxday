FROM registry.access.redhat.com/rhscl/ror-42-rhel7:latest

LABEL maintainer Mike Bonnet <mikeb@redhat.com>
EXPOSE 3000
ENTRYPOINT ["scl", "enable", "rh-ror42", "rails server"]

ENV LANG en_US.UTF-8
ENV APP_HOME $HOME/fluxday

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN scl enable rh-ror42 "bundle install"
RUN mkdir -p -m 777 tmp db log public/uploads
RUN touch db/schema.rb log/development.log
RUN chmod 666 db/schema.rb log/development.log
COPY . $APP_HOME
