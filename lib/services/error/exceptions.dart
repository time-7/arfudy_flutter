import 'package:flutter/material.dart';

class CoreException implements Exception {
  CoreException(StackTrace stackTrace, String label) {
    debugPrintStack(label: 'Exception :: $label', stackTrace: stackTrace);
  }
}

class GetBadRequisitionException extends CoreException {
  GetBadRequisitionException(super.stackTrace, super.label);
}

class GetMealsException extends CoreException {
  GetMealsException(super.stackTrace, super.label);
}
