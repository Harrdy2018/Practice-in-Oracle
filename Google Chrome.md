### 配置yum源

```linux
vim /ect/yum.repos.d/google-chrome.repo

[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
```

***
### 安装
* yum -y install google-chrome-stable
* 失败请尝试
* yum -y install google-chrome-stable --nogpgcheck
