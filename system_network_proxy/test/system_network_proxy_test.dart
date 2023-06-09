import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_network_proxy/system_network_proxy.dart';

void main() {
  const MethodChannel channel = MethodChannel('system_network_proxy');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (null));
  });

  test('getPlatformVersion', () async {
    expect(await SystemNetworkProxy.getProxyEnable(), true);
  });
}
