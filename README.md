By running the `start.sh` script it will build the docker image, download the nw.js symbols and start the container with the symbols mounted to the correct folder.

To find which port the server is exposed at, run `docker ps`

```
CONTAINER ID        IMAGE                               COMMAND                CREATED             STATUS              PORTS                     NAMES
d93f28884555        pexip/mini-breakpad-server:latest   "/bin/sh -c 'bash -l   17 seconds ago      Up 16 seconds       0.0.0.0:49153->1127/tcp   sad_heisenberg
```

To upload minidumps, send a POST request to the server with the following fields:

- `upload_file_minidump` - form-data with the minidump filename
- `prod` - the product name (e.g. "Pexip Infinity Connect")
- `ver` - the product version (e.g. "2.0.0")

```
POST /post HTTP/1.1
Host: localhost:49153
Cache-Control: no-cache

----WebKitFormBoundaryE19zNvXGzXaLvS5C
Content-Disposition: form-data; name="upload_file_minidump"; filename="f7fd0161-08a0-4ce1-9b9f-330fbfd772aa.dmp"
Content-Type: application/vnd.tcpdump.pcap


----WebKitFormBoundaryE19zNvXGzXaLvS5C
Content-Disposition: form-data; name="prod"

pexip infinity connect
----WebKitFormBoundaryE19zNvXGzXaLvS5C
Content-Disposition: form-data; name="ver"

2.0.0
----WebKitFormBoundaryE19zNvXGzXaLvS5C
```
