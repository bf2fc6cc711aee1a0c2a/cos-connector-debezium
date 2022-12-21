ARG DEBEZIUM_CONNECTOR
ARG DEBEZIUM_VERSION
ARG STRIMZI_VERSION
ARG KAFKA_VERSION

FROM quay.io/debezium/connect:${DEBEZIUM_VERSION} as upstream
FROM quay.io/rhoas/cos-connector-debezium-artifacts:2.0.1.ER1 as downstream
FROM quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-${KAFKA_VERSION}
ARG DEBEZIUM_CONNECTOR
ARG DEBEZIUM_VERSION
ARG STRIMZI_VERSION
ARG KAFKA_VERSION

COPY --from=upstream /kafka/external_libs/apicurio/ /opt/kafka/plugins/apicurio/
COPY --from=downstream /repository/debezium-connector-${DEBEZIUM_CONNECTOR}/ /opt/kafka/plugins/debezium-connector-${DEBEZIUM_CONNECTOR}/

USER 1001
