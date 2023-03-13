import 'package:flutter/material.dart';

import 'app/app.dart';
import 'data/db.dart';

void main() async {
  await DBHelper.initDb();

  runApp(MyApp());
}
