# shellscript
# The largest heading
## The second largest heading
###### The smallest heading

```python
#!/usr/bin/python
my_input = input("Enter number : ")
print my_input
```

- [x] Finish my changes
- [ ] Push my commits to GitHub
- [ ] Open a pull request

## Table of Contents
- [Rewrite and Redirection](#rewrite-and-redirection)
    - [Force www](#force-www)
    - [Redirect a Single Page](#redirect-a-single-page)
    
## Rewrite and Redirection
Note: It is assumed that you have `mod_rewrite` installed and enabled.

### Force www
``` apacheconf
RewriteEngine on
RewriteCond %{HTTP_HOST} ^example\.com [NC]
RewriteRule ^(.*)$ http://www.example.com/$1 [L,R=301,NC]
```


[Source](http://www.abeautifulsite.net/access-pages-without-the-php-extension-using-htaccess/)

### Redirect a Single Page
``` apacheconf
Redirect 301 /oldpage.html http://www.example.com/newpage.html
Redirect 301 /oldpage2.html http://www.example.com/folder/
```
