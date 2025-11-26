#!/bin/bash
cd /home/kavia/workspace/code-generation/mvp-final-212145-212164/CareerPlatformWebFrontend
npm run build
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
   exit 1
fi

