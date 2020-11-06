import 'package:bsengine_flutter/pages/about.dart';
import 'package:bsengine_flutter/pages/activity_detail.dart';
import 'package:bsengine_flutter/pages/activitys.dart';
import 'package:bsengine_flutter/pages/password.dart';
import 'package:bsengine_flutter/pages/phone_login.dart';
import 'package:bsengine_flutter/pages/search.dart';
import 'package:bsengine_flutter/pages/setting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

Handler loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PhoneLoginPage();
  },
);

Handler settingHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SettingPage();
  },
);

Handler passwordHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PasswordPage();
  },
);


Handler aboutHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return AboutPage();
  },
);

Handler activitiesHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ActivitiesPage();
  },
);

Handler activityDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ActivityDetailPage();
  },
);

Handler searchHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SearchPage();
  },
);
