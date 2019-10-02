#!/bin/bash
ROOTDIR=`git rev-parse --show-toplevel`

case "$OSTYPE" in
  darwin*)
    PLATFORM=darwin64
    EXT=.dylib
    ;;
  linux*)
    PLATFORM=linux64
    ;;
  *)
    echo "Unknown operating system. Building on this system is not supported."
    exit 1;
    ;;
esac

export IASTAGENT_LOGGING_STDERR_LEVEL=info

export LD_LIBRARY_PATH="/Users/layro01/vscode/hailstone/iast-dev/out/agent/Debug/java/"
export MAVEN_OPTS=-agentpath:${LD_LIBRARY_PATH}libagent_java_${PLATFORM}${EXT}

mvn clean install