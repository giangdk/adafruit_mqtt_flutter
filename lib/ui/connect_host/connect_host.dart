/*
 * Package : mqtt_client
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 31/05/2017
 * Copyright :  S.Hamblett
 */

import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

/// An annotated simple subscribe/publish usage example for mqtt_server_client. Please read in with reference
/// to the MQTT specification. The example is runnable, also refer to test/mqtt_client_broker_test...dart
/// files for separate subscribe/publish tests.

/// First create a client, the client is constructed with a broker name, client identifier
/// and port if needed. The client identifier (short ClientId) is an identifier of each MQTT
/// client connecting to a MQTT broker. As the word identifier already suggests, it should be unique per broker.
/// The broker uses it for identifying the client and the current state of the client. If you don’t need a state
/// to be hold by the broker, in MQTT 3.1.1 you can set an empty ClientId, which results in a connection without any state.
/// A condition is that clean session connect flag is true, otherwise the connection will be rejected.
/// The client identifier can be a maximum length of 23 characters. If a port is not specified the standard port
/// of 1883 is used.
/// If you want to use websockets rather than TCP see below.

final client = MqttServerClient.withPort(
  'io.adafruit.com',
  'Maiducgiang01',
  1883,
);

var pongCount = 0; // Pong counter

Future<int> concectBroker({Function? connect, Function? disconnect}) async {
  /// A websocket URL must start with ws:// or wss:// or Dart will throw an exception, consult your websocket MQTT broker
  /// for details.
  /// To use websockets add the following lines -:
  /// client.useWebSocket = true;
  /// client.port = 80;  ( or whatever your WS port is)
  /// There is also an alternate websocket implementation for specialist use, see useAlternateWebSocketImplementation
  /// Note do not set the secure flag if you are using wss, the secure flags is for TCP sockets only.
  /// You can also supply your own websocket protocol list or disable this feature using the websocketProtocols
  /// setter, read the API docs for further details here, the vast majority of brokers will support the client default
  /// list so in most cases you can ignore this.

  /// Set logging on if needed, defaults to off
  client.logging(on: true);

  /// Set the correct MQTT protocol for mosquito
  client.setProtocolV311();

  /// If you intend to use a keep alive you must set it here otherwise keep alive will be disabled.
  client.keepAlivePeriod = 20;

  /// The connection timeout period can be set if needed, the default is 5 seconds.
  client.connectTimeoutPeriod = 10000; // milliseconds

  /// Add the unsolicited disconnection callback
  client.onDisconnected = onDisconnected;

  /// Add the successful connection callback
  client.onConnected = onConnected;

  /// Add a subscribed callback, there is also an unsubscribed callback if you need it.
  /// You can add these before connection or change them dynamically after connection if
  /// you wish. There is also an onSubscribeFail callback for failed subscriptions, these
  /// can fail either because you have tried to subscribe to an invalid topic or the broker
  /// rejects the subscribe request.
  client.onSubscribed = onSubscribed;

  /// Set a ping received callback if needed, called whenever a ping response(pong) is received
  /// from the broker.
  client.pongCallback = pong;

  /// Create a connection message to use or use the default one. The default one sets the
  /// client identifier, any supplied username/password and clean session,
  /// an example of a specific one below.
  final connMess = MqttConnectMessage()
      .authenticateAs('Maiducgiang01', 'aio_oiWT97ARKTcdgVCytMGG9rOjmjCe')
      .withClientIdentifier('Maiducgiang01')
      .withWillTopic('willtopic') // If you set this you must set a will message
      .withWillMessage('My Will message')
      .startClean() // Non persistent session for testing
      .withWillQos(MqttQos.atLeastOnce);
  print('EXAMPLE::Mosquitto client connecting....');
  client.connectionMessage = connMess;

  /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
  /// in some circumstances the broker will just disconnect us, see the spec about this, we however will
  /// never send malformed messages.
  try {
    await client.connect();
  } on NoConnectionException catch (e) {
    // Raised by the client when connection fails.
    disconnect!.call();
    print('EXAMPLE::client exception - $e');
    client.disconnect();
  } on SocketException catch (e) {
    // Raised by the socket layer
    disconnect!.call();
    print('EXAMPLE::socket exception - $e');
    client.disconnect();
  }

  /// Check we are connected
  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('EXAMPLE::Mosquitto client connected');
    connect?.call();
  } else {
    disconnect!.call();

    /// Use status here rather than state if you also want the broker return code.
    print('EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
  }

  /// Ok, lets try a subscription
  // print('EXAMPLE::Subscribing to the test/lol topic');
  // const topic = 'test/lol'; // Not a wildcard topic
  // client.subscribe(topic, MqttQos.atMostOnce);

  /// The client has a change notifier object(see the Observable class) which we then listen to to get
  /// notifications of published updates to each subscribed topic.
  client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    for (int i = 0; i < c!.length; i++) {
      final recMess = c[i].payload as MqttPublishMessage;
      final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      // if (c[i].topic == "MQTT_ESP32/DOAM") doam = pt;
      // if (c[i].topic == "MQTT_ESP32/NHIETDO") nhietdo = pt;

      /// The above may seem a little convoluted for users only interested in the
      /// payload, some users however may be interested in the received publish message,
      /// lets not constrain ourselves yet until the package has been in the wild
      /// for a while.
      /// The payload is a byte buffer, this will be specific to the topic
      print('EXAMPLE::Change notification:: topic is <${c[i].topic}>, payload is <-- $pt -->');
      print('');
    }
    //   final recMess = c[0].payload as MqttPublishMessage;
    // final pt =
    //     MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

    // /// The above may seem a little convoluted for users only interested in the
    // /// payload, some users however may be interested in the received publish message,
    // /// lets not constrain ourselves yet until the package has been in the wild
    // /// for a while.
    // /// The payload is a byte buffer, this will be specific to the topic
    // print(
    //     'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
    // print('');
  });

  /// If needed you can listen for published messages that have completed the publishing
  /// handshake which is Qos dependant. Any message received on this stream has completed its
  /// publishing handshake with the broker.
  client.published!.listen((MqttPublishMessage message) {
    print('EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
  });

  /// Lets publish to our topic
  /// Use the payload builder rather than a raw buffer
  /// Our known topic to publish to
  const pubTopic = 'Maiducgiang01/feeds/temp';
  final builder = MqttClientPayloadBuilder();
  builder.addString('1');

  /// Subscribe to it
  print('EXAMPLE::Subscribing to the topic/led1 topic');
  client.subscribe(pubTopic, MqttQos.exactlyOnce);
  client.subscribe("Maiducgiang01/feeds/humi", MqttQos.exactlyOnce);
  client.subscribe("Maiducgiang01/feeds/temp", MqttQos.exactlyOnce);

  /// Publish it
  print('EXAMPLE::Publishing our topic');
  client.publishMessage(pubTopic, MqttQos.atMostOnce, builder.payload!);
  //pushMess("test/topic", "connected");
  // const pubTopic2 = 'topic/led2';
  // final builder2 = MqttClientPayloadBuilder();
  // builder2.addString('1234 giang');

  // /// Subscribe to it
  // print('EXAMPLE::Subscribing to the topic/led2 topic');
  // client.subscribe(pubTopic, MqttQos.exactlyOnce);

  // /// Publish it
  // print('EXAMPLE::Publishing our topic');
  // client.publishMessage(pubTopic2, MqttQos.exactlyOnce, builder2.payload!);

  /// Ok, we will now sleep a while, in this gap you will see ping request/response
  /// messages being exchanged by the keep alive mechanism.
  print('EXAMPLE::Sleeping....');
  await MqttUtilities.asyncSleep(60);

  /// Finally, unsubscribe and exit gracefully
  // print('EXAMPLE::Unsubscribing');
  // client.unsubscribe(topic);

  // /// Wait for the unsubscribe message from the broker if you wish.
  // await MqttUtilities.asyncSleep(2);
  // print('EXAMPLE::Disconnecting');
  // client.disconnect();
  // print('EXAMPLE::Exiting normally');
  return 0;
}

void pushMess(
  String toppic,
  String mess,
) {
  final pubTopic = toppic;
  final builder = MqttClientPayloadBuilder();
  builder.addString(mess);

  /// Subscribe to it
  print('EXAMPLE::Subscribing to the topic: ${toppic} ');
  client.subscribe("Maiducgiang01/feeds/" + pubTopic.toString(), MqttQos.exactlyOnce);

  /// Publish it
  print('EXAMPLE::Publishing our topic message: ${mess}');
  client.publishMessage("Maiducgiang01/feeds/" + pubTopic.toString(), MqttQos.exactlyOnce, builder.payload!);

  return;
}

/// The subscribed callback
void onSubscribed(String topic) {
  print('EXAMPLE::Subscription confirmed for topic $topic');
}

/// The unsolicited disconnect callback
void onDisconnected() {
  print('EXAMPLE::OnDisconnected client callback - Client disconnection');
  if (client.connectionStatus!.disconnectionOrigin == MqttDisconnectionOrigin.solicited) {
    print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
  } else {
    print('EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
    exit(-1);
  }
  if (pongCount == 3) {
    print('EXAMPLE:: Pong count is correct');
  } else {
    print('EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount');
  }
}

/// The successful connect callback
void onConnected() {
  print('EXAMPLE::OnConnected client callback - Client connection was successful');
}

/// Pong callback
void pong() {
  print('EXAMPLE::Ping response client callback invoked');
  pongCount++;
}
