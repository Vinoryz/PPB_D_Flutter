import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Helo anjay'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Center(
        child: Text(
          'helo anjay',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey[600],
            fontFamily: 'IndieFlower',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink[200],
        child: Text('click'),
      ),
    ),
  ),
);
