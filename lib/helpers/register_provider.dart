import 'package:provider/provider.dart';
import 'package:template_flutter/provider/button_shadow_provider.dart';

var providers = [
  ChangeNotifierProvider(
    create: (context) => ButtonShadowProvider(),
  )
];
