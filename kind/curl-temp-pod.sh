kubectl run curl-test --image=curlimages/curl --rm -it --restart=Never -- curl <service-name>:<port>

## Other namespace http://my-service.other-namespace.svc.cluster.local:<port>