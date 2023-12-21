import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Buisness extends StatefulWidget {
  const Buisness({super.key});

  @override
  State<Buisness> createState() => _BuisnessState();
}

void fetchData() async {
  const url = 'https://otaapi.jazeeraairways.com/api/jz/v1/AvailableStations';
  const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJPVEEiLCJqdGkiOiI4N2E0YzE5Ni1hMmE1LTZmYzMtNDg1ZC0zMjlmZWE2MWI1OTUiLCJpc3MiOiJkb3RSRVogQVBJIn0.IKPTYxW5MxaoyQ_eI1k1wYaFaN2tjV9QYMKjdL5YVQI'; // Replace with your actual token
  const agentID = 'AEAROOHAAPI';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'AgentID': agentID,
        'Accept': '*/*',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Error message: ${response.body}');
    }
  } catch (e) {
    print('Error during HTTP request: $e');
  }
}


class _BuisnessState extends State<Buisness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buisness'),
      ),
      body: Column(
        children: [
          const Center(child: Text('Buisness メンテナンス中')),
          ElevatedButton(
            onPressed: () {
              fetchData();
            },
            child: const Text('Fetch API'),
          ),
        ],
      ),
    );
  }
}
