#!/bin/bash
kill -QUIT $(cat tmp/pids/unicorn.pid)
unicorn -c unicorn.rb -E development -D
