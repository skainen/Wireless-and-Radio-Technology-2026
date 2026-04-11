## How it works:

```socket_sensor.py``` simulates a sensor by generating temperature readings and sending them over a TCP socket to ```edge_device.py```. The edge device acts as an IoT gateway, which receives the raw data and then publishes it to an MQTT topic on a public broker (broker.emqx.io). ```mqtt_alert_sub.py``` runs on the cloud server, subscribed to that topic. When a message arrives and the temperature is above a set threshold, it sends an alert to a Telegram bot via HTTP POST to the bot API, which delivers the notification to the user.

### Telegram alerts

<img width="382" height="185" alt="image" src="https://github.com/user-attachments/assets/f960a3ef-91ee-44b3-9f7d-6093fd21ba08" />

### Why is MQTT useful for building monitoring and alert systems in IoT?

**Publish/subscribe decoupling:** the sensor does not need to know anything about who is listening. We can add a Telegram alerter, a database logger, and a dashboard subscriber all on the same topic without touching the sensor code.

**Lightweight protocol:** designed for constrained devices and unreliable networks. MQTT has low overhead compared to HTTP polling, which matters when we have multiple sensors sending data simultaneously.

**Broker handles distribution:** the broker fans out messages to all subscribers automatically. If we later want to alert on multiple channels like Telegram, email and SMS, we can just add more subscribers.

We can also easily guarantee data delivery by defining **Quality of Service** level (QoS 0, 1 or 2) in code.  Higher reliability (higher QoS levels) uses more network overhead and adds latency, but might be necessary for critical data. A sensor publishing every second at QoS 2 is doing 4x work compared to QoS 0. For our sensor data, QoS 1 would be ideal as it guarantees all data gets through. It can occasionally duplicate the data, but that is not a big problem in an alert system.
