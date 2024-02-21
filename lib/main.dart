import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/common/common.dart';
import 'package:x_clone/features/auth/controller/auth_controller.dart';
import 'package:x_clone/features/auth/view/signup_view.dart';
import 'package:x_clone/features/home/view/home_view.dart';
import 'package:x_clone/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 890.3),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'K',
        theme: AppTheme.theme,
        home: ref.watch(currentUserAccountProvider).when(
              data: (user) {
                ref.watch(currentUserAccountProvider);
                if (user != null) {
                  return const HomeView();
                }
                return const SignUpView();
              },
              error: (error, st) => ErrorPage(
                error: error.toString(),
              ),
              loading: () => const LoadingPage(),
            ),
      ),
    );
  }
}
