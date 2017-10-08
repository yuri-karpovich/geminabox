#!/bin/bash
set -e
unicorn -p 9292 -c /webapps/server/config/config.ru
