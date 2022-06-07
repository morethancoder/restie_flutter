import 'package:flutter/material.dart';
import 'package:restie/models/user_model.dart';
import 'package:restie/services/api_service.dart';

class ReadDataPage extends StatefulWidget {
  const ReadDataPage({Key? key}) : super(key: key);

  @override
  State<ReadDataPage> createState() => _ReadDataPageState();
}

class _ReadDataPageState extends State<ReadDataPage> {
  //? here we create field to store data from our api
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;

    Future.delayed(const Duration(seconds: 0)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("استلام بيانات وعرضها ")),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.green[50],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                _userModel![index].id.toString() + "  ",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                _userModel![index].username,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.blue[100],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                _userModel![index].email,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                _userModel![index].website,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}


//? checkout visibility wedgit
