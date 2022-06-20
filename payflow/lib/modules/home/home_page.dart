import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("HomePage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Welcome to HomePage", textAlign: TextAlign.center),
          TextButton(
              onPressed: () async {
                bool leave = await logout();
                if (leave) {
                  Navigator.pushReplacementNamed(context, "/splash");
                }
              },
              child: Text("Logout"))
        ],
      )
    );
  }

  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.clear();
    
    return true;
  }
}