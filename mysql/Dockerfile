ARG DEBEZIUM_VERSION=nightly
ARG STRIMZI_VERSION=0.26.0
ARG KAFKA_VERSION=2.8.1

FROM quay.io/debezium/connect:${DEBEZIUM_VERSION} as upstream
FROM quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-${KAFKA_VERSION}

COPY --from=upstream /kafka/connect/debezium-connector-mysql/ /opt/kafka/plugins/debezium-connector-mysql/

USER 1001