#!/usr/bin/env bash
echo "*************************************************"
echo "*       Run container with Jenkins slave        *"
echo "*                     @2019                     *"
echo "*************************************************"

docker run -d --name="qaslave" --add-host="git.sptnk.co:127.0.0.2" --add-host="qa.sptnk.co:127.0.0.55"  -v /var/lib/jenkins:/var/lib/jenkins sptnk/qa_slave -url http://127.0.0.53:80 -workDir=/var/lib/jenkins fa5e0f4e8b8f8 qa
