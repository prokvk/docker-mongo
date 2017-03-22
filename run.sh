#! /bin/bash

exec /usr/bin/docker run --rm --name mongo -p 27017:27017 -v /usr/local/src/mongo:/data/db mongo mongod --nojournal --smallfiles