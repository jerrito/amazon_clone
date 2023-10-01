import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required VoidCallback onSuccess,
  required BuildContext context,
}){
  switch(response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnack(context: context, message:
      jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnack(context: context, message:
      jsonDecode(response.body)['error']);
      break;
    default:
      showSnack(context: context, message:
      (response.body));


  }
}