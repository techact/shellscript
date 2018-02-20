ssh user@host 'df -h'

ssh user@host << EOF
df -h
mkdir -p /home/user/test
EOF

value="variable"
ssh user@host bash -c "'
ls
pwd
if true; then
    echo $value
else
    echo "False"
fi
'"

ssh user@host 'bash -s' << EOF 2>&1 >> /tmp/local.log
df -h
free -m > remote.log
EOF


