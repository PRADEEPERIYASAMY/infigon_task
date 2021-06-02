import 'package:flutter/material.dart';
import 'package:infigon_task/configs/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBar(
            toolbarHeight: 120,
            title: Text(
              "Infigon",
              style: TextStyle(
                color: AppColors.white,
                letterSpacing: 1,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.blue_1,
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        AppColors.blue_1,
                        AppColors.blue_1,
                        AppColors.blue_2,
                      ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 24, right: 24, top: 20, bottom: 8),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill,
                        ))),
                Center(
                    child: Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 150, bottom: 8),
                  width: double.infinity,
                  child: Text(
                    "Analyze your Mark",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
                Center(
                    child: Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/AnalyzerPage");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                    color: AppColors.white,
                  ),
                )),
              ],
            )
          ],
        ));
  }
}
