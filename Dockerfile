ARG DEBEZIUM_CONNECTOR
ARG DEBEZIUM_VERSION_UPSTREAM
ARG DEBEZIUM_VERSION_DOWNSTREAM
ARG STRIMZI_VERSION
ARG KAFKA_VERSION

FROM quay.io/debezium/connect:${DEBEZIUM_VERSION_UPSTREAM} as upstream
FROM quay.io/rhoas/cos-connector-debezium-artifacts:${DEBEZIUM_VERSION_DOWNSTREAM} as downstream
FROM quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-${KAFKA_VERSION}
ARG DEBEZIUM_CONNECTOR
ARG DEBEZIUM_VERSION
ARG STRIMZI_VERSION
ARG KAFKA_VERSION

COPY --from=upstream /kafka/external_libs/apicurio/ /opt/kafka/plugins/apicurio/
COPY --from=downstream /repository/debezium-connector-${DEBEZIUM_CONNECTOR}/ /opt/kafka/plugins/debezium-connector-${DEBEZIUM_CONNECTOR}/

USER 1001
