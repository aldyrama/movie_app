import 'package:flutter/material.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/di/injection_container.dart' as di;

import 'app_config.dart';
import 'movie_app.dart';

void main() async {
  Config.appFlavor = Flavor.DEVELOPMENT;
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(ApiConstant.baseUrlProd);
  runApp(const MovieApp());
}
