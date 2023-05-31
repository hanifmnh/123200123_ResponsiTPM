import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailFood extends StatefulWidget {
  const DetailFood({Key? key, required this.foodId}) : super(key: key);

  final String foodId;

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  Future<Map<String, dynamic>> fetchFoodById() async {
    final response = await http.get(Uri.parse('http://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.foodId}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final food = data['meals'][0];
      return food;
    } else {
      throw Exception('Failed to fetch food');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Detail'),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Text(
      //         food['strMeal'],
      //         style: const TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 24
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
