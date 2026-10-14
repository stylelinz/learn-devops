#! /usr/bin/env bash

./hello.sh

hello=$?
echo "hello.sh exit code: $hello"

./greet.sh

greet=$?
echo "greet.sh exit code: $greet"

if [ "$greet" -ne 0 ]; then
  echo "greet.sh 失敗"
else
  echo "greet.sh 成功"
fi

./hello.sh && echo "hello.sh passed"
./hello.sh || echo "Does this will pass?"
./greet.sh || echo "greet.sh without argument"

./greet.sh && echo "pass" || echo "failed"

# 實驗
true && false || echo "實驗：我覺得這行會印出來"