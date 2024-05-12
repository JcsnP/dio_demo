import 'package:dio/dio.dart';
import 'package:dio_demo/models/cat_fact_model.dart';
import 'package:dio_demo/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Api _api = Api();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cat Fact.'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: _api.getCatFact(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CatFact? fact = snapshot.data;
                  if (fact != null) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            fact.fact,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0,
                                    vertical: 16.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      6.0,
                                    ),
                                    side: const BorderSide(
                                      color: Color(
                                        0xFFEEEDEF,
                                      ),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  await Clipboard.setData(
                                    ClipboardData(text: fact.fact),
                                  );
                                },
                                icon: const Icon(
                                  Icons.copy_outlined,
                                  size: 16.0,
                                ),
                                label: const Text("Refresh!"),
                              ),
                              const SizedBox(width: 12.0),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5627FF),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0,
                                    vertical: 16.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      6.0,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.refresh_outlined,
                                  size: 16.0,
                                ),
                                label: const Text("Refresh!"),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
