import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infigon_task/components/BarGraph.dart';
import 'package:infigon_task/components/InputField.dart';
import 'package:infigon_task/configs/colors.dart';
import 'package:infigon_task/models/BarChartModel.dart';
import 'package:infigon_task/enums/SubjectEnum.dart';

class AnalyzerPage extends StatefulWidget {
  @override
  _AnalyzerPageState createState() => _AnalyzerPageState();
}

class _AnalyzerPageState extends State<AnalyzerPage> {
  // initial data to be plotted
  List<BarChartModel> data = [
    BarChartModel(subject: SubjectEnum.English.name, mark: 100),
    BarChartModel(subject: SubjectEnum.ComputerScience.name, mark: 50),
    BarChartModel(subject: SubjectEnum.Science.name, mark: 40),
    BarChartModel(subject: SubjectEnum.SocialScience.name, mark: 80),
    BarChartModel(subject: SubjectEnum.GeneralKnowledge.name, mark: 70),
  ];

  // handlers for input marks
  final _engController = TextEditingController();
  final _comController = TextEditingController();
  final _sciController = TextEditingController();
  final _socController = TextEditingController();
  final _gkController = TextEditingController();

  List<int> temp = [];

  String poor = SubjectEnum.Science.fullName;
  String strong = SubjectEnum.English.fullName;

  // function processes the input marks
  void process() {
    Navigator.pop(context);
    if (_engController.text.isNotEmpty &&
        _comController.text.isNotEmpty &&
        _sciController.text.isNotEmpty &&
        _socController.text.isNotEmpty &&
        _gkController.text.isNotEmpty) {
      setState(() {
        data = <BarChartModel>[
          BarChartModel(
              subject: SubjectEnum.English.name,
              mark: int.parse(_engController.text)),
          BarChartModel(
              subject: SubjectEnum.ComputerScience.name,
              mark: int.parse(_comController.text)),
          BarChartModel(
              subject: SubjectEnum.Science.name,
              mark: int.parse(_sciController.text)),
          BarChartModel(
              subject: SubjectEnum.GeneralKnowledge.name,
              mark: int.parse(_gkController.text)),
          BarChartModel(
              subject: SubjectEnum.SocialScience.name,
              mark: int.parse(_socController.text)),
        ];
        temp.clear();
        data.forEach((element) {
          temp.add(element.mark);
        });
        temp.sort();

        if (temp[0] == data[0].mark)
          poor = SubjectEnum.English.fullName;
        else if (temp[0] == data[1].mark)
          poor = SubjectEnum.ComputerScience.fullName;
        else if (temp[0] == data[2].mark)
          poor = SubjectEnum.Science.fullName;
        else if (temp[0] == data[3].mark)
          poor = SubjectEnum.GeneralKnowledge.fullName;
        else if (temp[0] == data[4].mark)
          poor = SubjectEnum.SocialScience.fullName;

        if (temp.last == data[0].mark)
          strong = SubjectEnum.English.fullName;
        else if (temp.last == data[1].mark)
          strong = SubjectEnum.ComputerScience.fullName;
        else if (temp.last == data[2].mark)
          strong = SubjectEnum.Science.fullName;
        else if (temp.last == data[3].mark)
          strong = SubjectEnum.GeneralKnowledge.fullName;
        else if (temp.last == data[4].mark)
          strong = SubjectEnum.SocialScience.fullName;
      });
    }
    _engController.text = '';
    _comController.text = '';
    _sciController.text = '';
    _gkController.text = '';
    _socController.text = '';
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBar(
            toolbarHeight: 120,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              tooltip: 'Exit',
              padding: EdgeInsets.only(left: 16),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Subject Analyzer",
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
              height: 100,
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
              //rgb(36,85,175) rgb(55,118,254)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        color: AppColors.white,
                        elevation: 4,
                        child: Container(
                            padding: EdgeInsets.all(32),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Results",
                                      style: TextStyle(
                                        color: AppColors.blue_1,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 5,
                                    child: BarGraph(
                                      data: data,
                                    ))
                              ],
                            )),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 42, bottom: 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        color: AppColors.green,
                        elevation: 4,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(left: 32),
                                  child: Text(
                                    "Strong",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(right: 32),
                                  child: Text(
                                    "$strong",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 0, bottom: 42),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        color: AppColors.red,
                        elevation: 4,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(left: 32),
                                  child: Text(
                                    "Weak",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(right: 32),
                                  child: Text(
                                    "$poor",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 0, bottom: 16),
                      child: MaterialButton(
                        onPressed: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0))),
                              backgroundColor: AppColors.white,
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InputField(
                                        hint: SubjectEnum.English.fullName,
                                        controller: _engController,
                                      ),
                                      InputField(
                                        hint: SubjectEnum
                                            .ComputerScience.fullName,
                                        controller: _comController,
                                      ),
                                      InputField(
                                        hint: SubjectEnum.Science.fullName,
                                        controller: _sciController,
                                      ),
                                      InputField(
                                        hint: SubjectEnum
                                            .GeneralKnowledge.fullName,
                                        controller: _gkController,
                                      ),
                                      InputField(
                                        hint:
                                            SubjectEnum.SocialScience.fullName,
                                        controller: _socController,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 56, vertical: 4),
                                          child: MaterialButton(
                                            onPressed: process,
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text(
                                                "Done",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: AppColors.white),
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            elevation: 2,
                                            color: AppColors.blue_2,
                                            minWidth: double.infinity,
                                          )),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Text(
                          "View More",
                          style: TextStyle(
                            fontSize: 24,
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
