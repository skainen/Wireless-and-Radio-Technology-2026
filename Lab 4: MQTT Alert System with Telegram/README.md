## How it works:

socket_sensor.py simulates a sensor by generating temperature readings and sending them over a TCP socket to edge_device.py. The edge device acts as an IoT gateway, which receives the raw data and then publishes it to an MQTT topic on a public broker (broker.emqx.io). mqtt_alert_subscriber.py runs on the cloud server, subscribed to that topic. When a message arrives and the temperature is above a set threshold, it sends an alert to a Telegram bot via HTTP POST to the bot API, which delivers the notification to the user.

### Telegram alerts

<img width="382" height="185" alt="image" src="https://github.com/user-attachments/assets/f960a3ef-91ee-44b3-9f7d-6093fd21ba08" />
