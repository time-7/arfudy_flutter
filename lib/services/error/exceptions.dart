import 'package:flutter/material.dart';

class CoreException implements Exception {
  CoreException(StackTrace stackTrace, label, dynamic exception) {
    debugPrintStack(label: 'Exception :: $label', stackTrace: stackTrace);
  }
}

class GetBadRequisitionException extends CoreException {
  GetBadRequisitionException(super.stackTrace, super.label, super.exception);
}

class GetMealsException extends CoreException {
  GetMealsException(super.stackTrace, super.label, super.exception);
}
