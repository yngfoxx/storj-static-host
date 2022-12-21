# Storj DCS - Static Web Hosting Setup With Docker

## Prerequisite

### Storj

1. Create a storj bucket.
2. (Optional) Create a `/www` folder in the bucket.
3. Upload an `index.html` file to the root folder (`www` is the root folder for `BUCKET_NAME/www`)
3. Create an access token with `read` and `list` permissions for the bucket.
4. Build the image with the arguments as shown below then run it.
5. The container will output the zone records you need to terminal.
6. Update your DNS records with the zone records, and that's all :)

Note: Terminate the container once you are done.

### Build

Run the following command to build your docker image

```
docker build . -t storj-host \
    --build-arg ACCESS_GRANT=${ACCESS_GRANT} \
    --build-arg HOSTNAME=${HOSTNAME} \
    --build-arg BUCKET_PATH=${BUCKET_PATH} \
    --build-arg LINKSHARE_URL=https://link.storjshare.io
```
Note: BUCKET_PATH can be `BUCKET_NAME/www` or just `BUCKET_NAME`

### Run

Then you can start the image as a container with the following command

```
docker run storj-host
```
