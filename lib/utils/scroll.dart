import 'package:flutter/material.dart';

void onScrollNotification(ScrollNotification note, {Function reachBottom}) {
  var pixels = note.metrics.pixels;
  var maxScrollExtent = note.metrics.maxScrollExtent;

  if (maxScrollExtent - pixels <= 120) {
    reachBottom();
  }
}
