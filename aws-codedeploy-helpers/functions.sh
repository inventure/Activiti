#!/bin/bash

source /etc/profile

after_install() {

  COUNTRY_CODE=${1}

  URL_NAME=${APP_ENV}-${COUNTRY_CODE}-activiti.inventureaccess.com
  DOCROOT=/var/www/html/${URL_NAME}

  chown -R apache:apache ${DOCROOT}

  monit restart ${URL_NAME}-scala
}

before_install() {

  COUNTRY_CODE=${1}
  URL_NAME=${APP_ENV}-${COUNTRY_CODE}-activiti.inventureaccess.com
  DOCROOT=/var/www/html/${URL_NAME}

  if [ -d ${DOCROOT} ]; then
    rm -rf ${DOCROOT}/*
  fi

  monit stop ${URL_NAME}-scala
}
