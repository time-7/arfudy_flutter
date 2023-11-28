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

  late final int statusCode;
  final List<String> _failuresMessages = [];

  setStatusCode(int code) {
    statusCode = code;
  }

  printE() {
    debugPrintStack(
        label: 'Exception :: $label', stackTrace: StackTrace.current);
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

class GetMealsNewException extends NewCoreException {
  @override
  String get label => 'GetMealsException';
}

class GetOrdersNewException extends NewCoreException {
  @override
  String get label => 'GetOrdersException';
}

class InitServiceException extends NewCoreException {
  @override
  String get label => 'InitServiceException';
}

class GetServiceException extends NewCoreException {
  @override
  String get label => 'GetServiceException';
}

class PostOrderException extends NewCoreException {
  @override
  String get label => 'PostOrderException';
}

class EndServiceException extends NewCoreException {
  @override
  String get label => 'EndServiceExcepttion';
}
