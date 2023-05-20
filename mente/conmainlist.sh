#!/bin/bash
docker ps -a | cut -c 1-15,16-70,110- 