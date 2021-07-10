import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() {
    driver.close();
  });
  test('stream test', () async {
    await driver.waitFor(find.text('1'));
    await driver.takeScreenshot('Seen 1');
    await driver.waitFor(find.text('2'));
    await driver.takeScreenshot('Seen 3');
    await driver.waitFor(find.text('3'));
    await driver.takeScreenshot('Seen 2');
  });
}

extension on FlutterDriver {
  Future<void> takeScreenshot(String name) async {
    final filePath = File('screenshots/$name.png');
    if (await filePath.exists()) {
      await filePath.delete(recursive: true);
    }
    final file = await filePath.create(recursive: true);
    final png = await screenshot();
    file.writeAsBytesSync(png);
    print('Screenshot with name $name was taken');
  }
}
