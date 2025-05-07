import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/ViewModel/FilePickerViewModel/file_picker_viewModel.dart';

import 'Config/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilePickerViewmodel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ZapDocs',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteNames.splashView,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
