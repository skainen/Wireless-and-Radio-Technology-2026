## How it works:

```socket_sensor.py``` simulates a sensor by generating temperature readings and sending them over a TCP socket to ```edge_device.py```. The edge device acts as an IoT gateway, which receives the raw data and then publishes it to an MQTT topic on a public broker (broker.emqx.io). Grafana is set up in web app to subscribe to broker.emqx.io. Grafana visualizes the data and can be configured to display the data as user wants.

<img width="1262" height="652" alt="grafana_dashboard" src="https://github.com/user-attachments/assets/60f4b7c3-d0a7-4284-832d-c631ddc8d900" />



This MQTT dashboard setup is for live monitoring. The Grafana MQTT data source does not store event history on its own. To use older data, you must add a storage backend such as Loki or another time-series / log system.
