import 'package:flutter/material.dart';
import 'package:jsonjson/Helpers/Api.dart';
import 'package:jsonjson/Models/County.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Api api = new Api();
  List<County> datas = [];
  int selectedCountyId = 0;

  County selectedCounty = new County();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("5123673"),
      ),
      body: _body(),
    );
  }

  @override
  void initState() {
    super.initState();
    _getDatas();
  }

  _body() {
    if (selectedCountyId > 0) {
      return Text(selectedCounty.name ?? "");
    } else {
      return ListView.builder(
        itemBuilder: (context, i) {
          var q = datas[i];
          return Card(
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedCountyId = q.id!;
                  getData(q.id!);
                });
              },
              title: Text(q.name ?? ""),
              subtitle: Text(q.createTime ?? ""),
            ),
          );
        },
        itemCount: datas.length,
      );
    }
  }

  Future<void> _getDatas() async {
    final result = await api.getCounties();
    if (result != null) {
      setState(() {
        datas = result;
      });
    }
  }

  Future<void> getData(int id) async {
    final result = await api.getCounty(id);
    if (result != null) {
      setState(() {
        selectedCounty = result;
      });
    }
  }
}
