import 'package:bayanatz_assigment/core/routes_manager/routes_name.dart';
import 'package:bayanatz_assigment/faetures/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../faetures/add_department/presentation/add_department_screen.dart';

abstract class AppRoutes {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return PageTransition(
          type: PageTransitionType.fade,
          child: HomeScreen(),
          settings: settings,
        );
      case RoutesName.createDepartment:
        return PageTransition(
          type: PageTransitionType.fade,
          child: AddDepartmentScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
