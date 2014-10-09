#!/bin/bash

echo "crazy"

echo -n "FOO is "
if [[ -v FOO ]]; then
  echo "set to: $FOO"
else
  echo "not set"
fi

echo -n "ENAME is "
if [[ -v ENAME ]]; then
  echo "set to: $ENAME"
else
  echo "not set"
fi
