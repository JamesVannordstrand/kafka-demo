# Kafka Local Setup Instructions

This README provides step-by-step instructions for starting Kafka locally and testing it on a Windows machine.

## Prerequisites

- Download kafka - https://dlcdn.apache.org/kafka/3.5.0/kafka_2.13-3.5.0.tgz
- Using 7-Zip extract the contents of kafka_2.13-3.5.0.tgz
- Then Using 7-Zip again extract the contents of kafka_2.13-3.5.0.tar
- In kafka_2.13-3.5.0/config/server.properties update log.dirs=/kafka-logs
- In kafka_2.13-3.5.0/config/zookeeper.properties update dataDir=/zookeeper
- Open a terminal and navigate to the extracted files

## How to Start Locally 

1. Start the Zookeeper:
    ```
    .\bin\windows\zookeeper-server-start.bat .\config\zookeeper.properties
    ```

2. Start the Kafka server:
    ```
    .\bin\windows\kafka-server-start.bat .\config\server.properties
    ```

## How to Test

1. Create a topic named "test":
    ```
    .\bin\windows\kafka-topics.bat --create --topic test --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
    ```

2. Produce messages to the "test" topic:
    ```
    .\bin\windows\kafka-console-producer.bat --topic test --bootstrap-server localhost:9092
    ```

3. Consume messages from the "test" topic:
    ```
    .\bin\windows\kafka-console-consumer.bat --topic test --bootstrap-server localhost:9092 --from-beginning
    ```

## How to Stop them Locally

1.  When done stop kafka:
    ```
    .\bin\windows\kafka-server-stop.bat
    ```

2. then stop zookeeper:
    ```
    .\bin\windows\zookeeper-server-stop.bat

    ```

---