# PHP HOL

Docker image based on `php:5.6-fpm` specific for HOL Zend Application.

---

### Usage

```
docker run -d \
    -v $(pwd):/var/www/html \
    -p 9000:9000 \
    ferri/phphol
```

Now you can reference from nginx location `fastcgi_pass 127.0.0.1:9000;`.