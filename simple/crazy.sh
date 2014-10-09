echo "crazy"

echo -n "FOO is "
if [[ -v FOO ]]; then
  echo "set to: $FOO"
else
  echo "not set"
fi
