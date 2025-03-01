import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name, position, email, phoneNumber, imageUrl;

  const ProfileCard({super.key, required this.name, required this.position, required this.email, required this.phoneNumber, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 247, 247),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            offset: Offset(3, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50, // Image radius
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 10,),
          Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text(position, style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 131, 131, 131)),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, color: Colors.blue,),
              SizedBox(width: 5,),
              Text(email),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Colors.green,),
              SizedBox(width: 5,),
              Text(phoneNumber),
            ],
          ),
        ],
      ),
    );
  }
}