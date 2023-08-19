# Powershell script to download and setup Kafka

# Step 1: Download Kafka
Invoke-WebRequest -Uri "https://dlcdn.apache.org/kafka/3.5.0/kafka_2.13-3.5.0.tgz" -OutFile "kafka_2.13-3.5.0.tgz"

# Step 2: Extract .tgz using 7-Zip
7z e kafka_2.13-3.5.0.tgz -o"./" kafka_2.13-3.5.0.tar

# Step 3: Extract .tar using 7-Zip
7z x kafka_2.13-3.5.0.tar -o"./"

# Step 4: Update server.properties
(Get-Content -path ./kafka_2.13-3.5.0/config/server.properties) -replace '#log\.dirs=/tmp/kafka-logs', 'log.dirs=/kafka-logs' | Set-Content -path ./kafka_2.13-3.5.0/config/server.properties

# Step 5: Update zookeeper.properties
(Get-Content -path ./kafka_2.13-3.5.0/config/zookeeper.properties) -replace 'dataDir=/tmp/zookeeper', 'dataDir=/zookeeper' | Set-Content -path ./kafka_2.13-3.5.0/config/zookeeper.properties

# Step 6: Open terminal in the extracted files location
Start-Process -WorkingDirectory "./kafka_2.13-3.5.0/" -FilePath "cmd.exe"

