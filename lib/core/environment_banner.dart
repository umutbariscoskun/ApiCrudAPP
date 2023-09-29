import 'package:api_crud_app/core/env.dart';
import 'package:flutter/material.dart';

class EnvironmentBanner extends StatelessWidget {
  final Widget child;
  final String message;

  const EnvironmentBanner({
    required this.child,
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: EnvironmentConfig.isProd
          ? child
          : Banner(
              message: message,
              location: BannerLocation.topStart,
              color: EnvironmentConfig.isStage ? Colors.red : Colors.green,
              child: child,
            ),
    );
  }
}
