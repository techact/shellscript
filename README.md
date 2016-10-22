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
    
## Rewrite and Redirection
Note: It is assumed that you have `mod_rewrite` installed and enabled.

### Force www
``` apacheconf
RewriteEngine on
RewriteCond %{HTTP_HOST} ^example\.com [NC]
RewriteRule ^(.*)$ http://www.example.com/$1 [L,R=301,NC]
