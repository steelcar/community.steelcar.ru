![Caching-Process](https://cdn-1.wp.nginx.com/wp-content/uploads/2016/08/Garrett-Content_Caching-9_Caching-Process-11-14.jpg)
[High‑Performance Caching with NGINX and NGINX Plus](https://www.nginx.com/blog/nginx-high-performance-caching/)

https://gist.github.com/touhonoob/5364f6c9099609c826a4

https://serversforhackers.com/c/nginx-caching


```
proxy_cache_path /data/nginx/cache levels=1:2 keys_zone=static_cache:10m max_size=5g inactive=10y;
```

| arg | description |
| - | - |
| `/data/nginx/cache` | Is the place where the actual cache stored |
| `levels=1:2` | Is levels parameter sets the number of subdirectory levels in cache |
| `keys_zone=static_cache:10m` | Was defining shared memory zone named static_cache with maximum size 10 MB. It holds all active keys and metadata of the cache. |
| `max_size=5g` | Was maximum size of cache e.g. files size on `/data/nginx/cache` |
| `inactive=10y` | Specify maximum inactive time cache can be stored. Cached data that are not accessed during the time specified by the inactive parameter get removed from the cache regardless of their freshness. |


```
proxy_cache_lock on;
```

When enabled, only one request at a time will be allowed to populate
a new cache element identified according to the proxy_cache_key directive
by passing a request to a proxied server.
Other requests of the same cache element will either wait for a response
to appear in the cache or the cache lock for this element to be released,
up to the time set by the proxy_cache_lock_timeout directive.


```
proxy_cache_lock_age 5m;
```

If the last request passed to the proxied server for populating a new cache
element has not completed for the specified time, one more request
may be passed to the proxied server.


```
proxy_cache_lock_timeout    10m;
```

When the time expires, the request will be passed to the proxied server,
however, the response will not be cached.
