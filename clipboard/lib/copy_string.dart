import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

String host = "http://127.0.0.1";
bool hostValid = true;

String copiedText = '';
String validHost = '';

void changeHost(String h) {
  host = 'http://' + h + ':5000';
  fetchString();
}

void fetchString() async {
  try {
    if (host == '') {
      return;
    }
    final response = await http.get(Uri.parse(host));
    if (response.statusCode == 200) {
      if (!hostValid) {
        Fluttertoast.showToast(
          msg: 'Host accepted!!',
        );
        hostValid = true;
        validHost = host;
      }
      String text = response.body;
      if (text != copiedText) {
        Clipboard.setData(ClipboardData(text: text));
        copiedText = text;
      }
    } else {
      Fluttertoast.showToast(msg: 'Error connecting to server');
    }
  } on Exception {
    if (hostValid) {
      if (host != validHost) {
        Fluttertoast.showToast(msg: 'Invalid Host!');
        hostValid = false;
      }
    }
  }
}
