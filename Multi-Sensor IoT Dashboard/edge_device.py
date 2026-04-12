import socket
import paho.mqtt.client as mqtt

HOST = "192.168.122.1"
PORT = 8000

broker = "broker.emqx.io"

mqtt_client = mqtt.Client()
mqtt_client.connect(broker,1883)

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print("Edge device waiting for sensor...")

conn, addr = server.accept()

print("Sensor connected:", addr)

while True:

    data = conn.recv(1024)

    if not data:
        break

    message = data.decode()

    temperature, humidity, light = message.split(",")

    mqtt_client.publish("savonia/iot/temperature", temperature)
    mqtt_client.publish("savonia/iot/humidity", humidity)
    mqtt_client.publish("savonia/iot/light", light)

    print("Forwarded:", message)
