import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String id;

  const UserDetails({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('This is the user screen for id $id'),
      ),
    );
  }
}
