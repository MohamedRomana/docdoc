import 'package:flutter/material.dart';
import 'core/di/dependancy_injection.dart';
import 'core/helper/shared_pref_helper.dart';
import 'core/routing/app_router.dart';
import 'doc_doc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGitIt();
  await CacheHelper.init();
  runApp(DocDoc(appRouter: AppRouter()));
}
