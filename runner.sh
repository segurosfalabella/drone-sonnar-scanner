#!/bin/bash
#
# Sonnar Scanner CLI script.
# Written by Jose Bovet Derpich <jose.bovet@gmail.com>
set -e

# Default variables if not set
PLUGIN_URL=${PLUGIN_URL:-"false"}
PLUGIN_PROJECT_KEY=${PLUGIN_PROJECT_KEY:-"false"}
PLUGIN_SOURCE=${PLUGIN_SOURCE:-"false"}

#Optionals
PLUGIN_PROJECT_NAME=${PLUGIN_PROJECT_NAME:-"false"}
PLUGIN_PROJECT_VERSION=${PLUGIN_PROJECT_VERSION:-"false"}

#Authentication
PLUGIN_LOGIN=${PLUGIN_LOGIN:-"false"}
PLUGIN_PASSWORD=${PLUGIN_PASSWORD:-"false"}

#Web Services
PLUGIN_WS_TIMEOUT=${PLUGIN_WS_TIMEOUT:-"false"}

#Analysis LoggingINFO
PLUGIN_LOG_LEVEL=${PLUGIN_LOG_LEVEL:-"false"}
PLUGIN_VERBOSE=${PLUGIN_VERBOSE:-"false"}

# SONAR command
SONAR_PARAMS=""

addArgument() {
  echo $1
  SONAR_PARAMS="${SONAR_PARAMS} $1"
}

if [[ $PLUGIN_URL != "false" ]] ; then addArgument "-Dsonar.host.url=$PLUGIN_URL" ; fi
if [[ $PLUGIN_PROJECT_KEY != "false" ]] ; then addArgument "-Dsonar.projectKey=$PLUGIN_PROJECT_KEY" ; fi
if [[ $PLUGIN_SOURCE != "false" ]] ; then addArgument "-Dsonar.sources=$PLUGIN_SOURCE" ; fi
if [[ $PLUGIN_PROJECT_NAME != "false" ]] ; then addArgument "-Dsonar.projectName=$PLUGIN_PROJECT_NAME" ; fi
if [[ $PLUGIN_PROJECT_VERSION != "false" ]] ; then addArgument "-Dsonar.projectVersion=$PLUGIN_PROJECT_VERSION" ; fi
if [[ $PLUGIN_LOGIN != "false" ]] ; then addArgument "-Dsonar.login=$PLUGIN_LOGIN" ; fi
if [[ $PLUGIN_PASSWORD != "false" ]] ; then addArgument "-Dsonar.password=$PLUGIN_PASSWORD" ; fi
if [[ $PLUGIN_WS_TIMEOUT != "false" ]] ; then addArgument "-Dsonar.ws.timeout=$PLUGIN_WS_TIMEOUT" ; fi
if [[ $PLUGIN_LOG_LEVEL != "false" ]] ; then addArgument "-Dsonar.log.level=$PLUGIN_LOG_LEVEL" ; fi
if [[ $PLUGIN_VERBOSE != "false" ]] ; then addArgument "-Dsonar.verbose =$PLUGIN_VERBOSE" ; fi

echo "Executing Sonar ClI"
java -jar /opt/sonar/sonar-scanner-cli.jar $SONAR_PARAMS
