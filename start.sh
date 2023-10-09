#!/usr/bin/bash
export NEZHA_SERVER="xxx.xxxx.com:5555"
export NEZHA_KEY="d0hJ9XrXSb1abcdefg"

chmod +x server start.sh
nohup ./server -s ${NEZHA_SERVER} -p ${NEZHA_KEY} > /dev/null 2>&1 &

tail -f /dev/null
