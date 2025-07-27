import 'package:flutter/material.dart';
import 'core/di/dependancy_injection.dart';
import 'core/routing/app_router.dart';
import 'doc_doc.dart';

void main() {
  setUpGitIt();
  runApp(DocDoc(appRouter: AppRouter()));
}
