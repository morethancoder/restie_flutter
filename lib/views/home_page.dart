import 'package:flutter/material.dart';
import 'package:restie/views/read_data_page.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String? title;

  const HomePage({Key? key, this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String? jsonFromRead;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? " "),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: Text(
                        "اختر احد العمليات الاتية ",
                        style: GoogleFonts.cairo(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //? first button
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReadDataPage(),
                                ),
                              );
                            },
                            child: Container(
                              child: const Text(
                                "read data",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 251, 255, 0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(right: 50),
                            ),
                          ),
                          //? sec button
                          Container(
                            child: InkWell(
                              onTap: () async {
                                jsonFromRead = await http.read(Uri.parse(
                                    'https://jsonplaceholder.typicode.com/users'));

                                print(jsonFromRead);

                                setState(() {});

                                //? you can read text from any website
                              },
                              child: Container(
                                child: const Text(
                                  "print data",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 0, 255, 166),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      width: 500,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: 30),
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          children: [
                            Text(
                              jsonFromRead.toString(),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(
                            width: 2,
                            color: Colors.teal,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          jsonFromRead = " ";
                          setState(() {});
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.all(10),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
