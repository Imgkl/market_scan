import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Details extends StatelessWidget {
  final Map<String, dynamic> data;
  const Details({super.key, required this.data});

  Widget _getBody() {
    switch (data['type']) {
      case "value":
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: data['values']
                .map<Widget>((item) => Text(item.toString()))
                .toList(),
          ),
        );
      case "indicator":
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data['study_type'].toString().toUpperCase()),
              const Text("Set Parameters"),
              Row(
                children: [
                  Expanded(child: Text(data['parameter_name'])),
                  Expanded(
                      flex: 2,
                      child: TextField(
                        controller: TextEditingController(
                            text: data['default_value'].toString()),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )),
                ],
              ),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: _getBody(),
    );
  }
}
