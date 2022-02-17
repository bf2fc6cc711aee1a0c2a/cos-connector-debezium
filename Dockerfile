ARG DEBEZIUM_CONNECTOR
ARG DEBEZIUM_VERSION
ARG STRIMZI_VERSION
ARG KAFKA_VERSION

FROM quay.io/debezium/connect:${DEBEZIUM_VERSION} as upstream
FROM quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-${KAFKA_VERSION}

COPY --from=upstream /kafka/connect/debezium-connector-${DEBEZIUM_CONNECTOR}/ /opt/kafka/plugins/debezium-connector-${DEBEZIUM_CONNECTOR}/

USER 1001
