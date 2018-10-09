# docker-httpd-git
Small image to serve git


## Add Users

```
htpasswd -c /opt/git/.htpasswd <user>
```


## Add Repo

```
mkdir /opt/git/<repo>.git
cd /opt/git/<repo>.git
git --bare init
```

Push URL: http://localhost:8080/git/<repo>.git
