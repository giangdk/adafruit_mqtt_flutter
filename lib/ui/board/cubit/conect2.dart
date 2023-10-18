// import 'dart:async';
// import 'dart:io';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';

// var pongCount = 0;
// final client2 = MqttServerClient('broker.mqttdashboard.com', 'maiducgiang');
// Future<int> concectBroker2(
//     {Function? connect,
//     Function? disconnect,
//     required String toppic,
//     required String mess}) async {
//   client2.logging(on: true);

//   /// Set the correct MQTT protocol for mosquito
//   client2.setProtocolV311();

//   /// If you intend to use a keep alive you must set it here otherwise keep alive will be disabled.
//   client2.keepAlivePeriod = 20;

//   /// The connection timeout period can be set if needed, the default is 5 seconds.
//   client2.connectTimeoutPeriod = 2000; // milliseconds

//   /// Add the unsolicited disconnection callback
//   client2.onDisconnected = () {
//     print('EXAMPLE::OnDisconnected client callback - Client disconnection');
//     if (client2.connectionStatus!.disconnectionOrigin ==
//         MqttDisconnectionOrigin.solicited) {
//       print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
//     } else {
//       print(
//           'EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
//       exit(-1);
//     }
//     if (pongCount == 3) {
//       print('EXAMPLE:: Pong count is correct');
//     } else {
//       print('EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount');
//     }
//   };

//   /// Add the successful connection callback
//   client2.onConnected = () {
//     print(
//         'EXAMPLE::OnConnected client callback - Client connection was successful');
//   };

//   /// Add a subscribed callback, there is also an unsubscribed callback if you need it.
//   /// You can add these before connection or change them dynamically after connection if
//   /// you wish. There is also an onSubscribeFail callback for failed subscriptions, these
//   /// can fail either because you have tried to subscribe to an invalid topic or the broker
//   /// rejects the subscribe request.
//   client2.onSubscribed = (String topic) {
//     print('EXAMPLE::Subscription confirmed for topic $topic');
//   };

//   /// Set a ping received callback if needed, called whenever a ping response(pong) is received
//   /// from the broker.
//   client2.pongCallback = () {
//     print('EXAMPLE::Ping response client callback invoked');
//     pongCount++;
//   };

//   /// Create a connection message to use or use the default one. The default one sets the
//   /// client identifier, any supplied username/password and clean session,
//   /// an example of a specific one below.
//   final connMess = MqttConnectMessage()
//       .authenticateAs('maiducgiang', 'maiducgiang')
//       .withClientIdentifier('Mqtt_MyclientUniqueId')
//       .withWillTopic('willtopic') // If you set this you must set a will message
//       .withWillMessage('My Will message')
//       .startClean() // Non persistent session for testing
//       .withWillQos(MqttQos.atLeastOnce);
//   print('EXAMPLE::Mosquitto client connecting....');
//   client2.connectionMessage = connMess;

//   /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
//   /// in some circumstances the broker will just disconnect us, see the spec about this, we however will
//   /// never send malformed messages.
//   try {
//     await client2.connect();
//   } on NoConnectionException catch (e) {
//     // Raised by the client when connection fails.
//     disconnect!.call();
//     print('EXAMPLE::client exception - $e');
//     client2.disconnect();
//   } on SocketException catch (e) {
//     // Raised by the socket layer
//     disconnect!.call();
//     print('EXAMPLE::socket exception - $e');
//     client2.disconnect();
//   }

//   /// Check we are connected
//   if (client2.connectionStatus!.state == MqttConnectionState.connected) {
//     print('EXAMPLE::Mosquitto client connected');
//     final pubTopic = toppic;
//     final builder = MqttClientPayloadBuilder();
//     builder.addString(mess);

//     /// Subscribe to it
//     print('EXAMPLE::Subscribing to the topic: ${toppic} ');
//     client2.subscribe(pubTopic, MqttQos.exactlyOnce);

//     /// Publish it
//     print('EXAMPLE::Publishing our topic message: ${mess}');
//     client2.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);
//     connect?.call();
//     client2.disconnect();
//   } else {
//     disconnect!.call();

//     print(
//         'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client2.connectionStatus}');
//     client2.disconnect();
//     exit(-1);
//   }

//   client2.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
//     for (int i = 0; i < c!.length; i++) {
//       final recMess = c[i].payload as MqttPublishMessage;
//       final pt =
//           MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

//       print(
//           'EXAMPLE::Change notification:: topic is <${c[i].topic}>, payload is <-- $pt -->');
//       print('');
//     }
//   });

//   client2.published!.listen((MqttPublishMessage message) {
//     print(
//         'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
//   });

//   const pubTopic = 'topic/test';
//   final builder = MqttClientPayloadBuilder();
//   builder.addString('1');

//   /// Subscribe to it
//   print('EXAMPLE::Subscribing to the topic/led1 topic');
//   client2.subscribe(pubTopic, MqttQos.exactlyOnce);

//   /// Publish it
//   print('EXAMPLE::Publishing our topic');
//   client2.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);

//   print('EXAMPLE::Sleeping....');
//   await MqttUtilities.asyncSleep(60);

//   return 0;
// }
