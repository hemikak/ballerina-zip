FROM ballerina/ballerina:1.0.1

COPY libs/ libs/
COPY src/zip src/zip
COPY Ballerina.lock Ballerina.lock
COPY Ballerina.toml Ballerina.toml

RUN ballerina build -c zip
