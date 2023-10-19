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

abstract class NewCoreException implements Exception {
  String get label;
  List<String> get failureMessages => _failuresMessages;

  final List<String> _failuresMessages = [];

  printE() {
    debugPrintStack(label: 'Exception :: $label', stackTrace: StackTrace.current);
  }

  addFailureMessage(String message) {
    try {
      _failuresMessages.add(message);
    } catch (e) {
      _failuresMessages.add('Erro inesperado!');
      printE();
    }
  }
}

class GetTablesException extends NewCoreException {
  @override
  String get label => 'GetTablesException';
}
