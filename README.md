# Build and Deploy Debezium Connector Images

## Build and deployment basics

Debezium images for released Debezium versions are built by
creating a new tag in this repo with the `tag name` being
the Debezium version that is supposed to be included in
the images.

The container images then gets built and deployed for the
same Debezium version matching the tag name.

Strimzi and Strimzi's Kafka versions are set by
`STRIMZI_VERSION` and `KAFKA_VERSION` env vars in build.yml:
```
env:
  STRIMZI_VERSION: 0.32.0
  KAFKA_VERSION: 3.3.1
```

Nightly builds are triggered by changes in the main branch
and also executed twice a day from Debezium's upstream
`debezium/connect:nightly` image.

Create a pull request for any change!

## Build and deploy a new version

### Optional: Change Kafka and Strimzi versions

If you want to change the Strimzi or Kafka version, please
create a pull request with updating the env vars in
`.github/workflows/build.yml`.

There are automated tests that check if the images can be build.

### Build and deploy a new version

New versions are built from tags. The tag name/version must match
the Debezium version.

1. Make sure that the correct Strimzi and Kafka versions are set
in the `.github/workflows/build.yml`.
2. Create a new tag. The tag version/name must match the Debezium
version that gets deployed.
3. Create and push a new tag:
```console
git tag 1.9.0.Alpha2
git push origin --tags
```
4. Check Github Action run succeded building and deploying the images.

## Nightly builds

Nightly builds are triggered by changes in the main branch
and also executed twice a day from Debezium's upstream
`debezium/connect:nightly` image.

