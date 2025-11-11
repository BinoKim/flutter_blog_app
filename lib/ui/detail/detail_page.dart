import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          iconButton(Icons.delete, () {
            print("delete button");
          }),
          iconButton(Icons.edit, () {
            print("edit button");
          }),
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            "https://picsum.photos/200/300",
            fit: BoxFit.cover,
          ),
          Text("Today I Learned"),
          Text("Bino"),
          Text("2025.11.11 11:02"),
        ],
      ),
    );
  }

  Widget iconButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Icon(icon),
      ),
    );
  }
}
