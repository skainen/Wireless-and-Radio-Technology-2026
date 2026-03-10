Bluetooth client–server application in Python using RFCOMM sockets.

The system will simulate an IoT sensor node that sends sensor data to a gateway device over Bluetooth.

Client = sensor device

Server = gateway

How it works:
  - The client simulates a sensor
  - It generates a random value every 5 seconds
  - It sends the value to the server using Bluetooth
  - The server receives and prints the data

The main difference in practice to the socket connection is that Bluetooth uses Bluetooth MAC Address for binding instead of IP.
