import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String userId;
  Map<String, dynamic>? userDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  // Fetch the details of the user from Firestore
  Future<void> _fetchUserDetails() async {
    try {
      // Get the current user's ID
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        userId = currentUser.uid;

        // Fetch user details from Firestore
        DocumentSnapshot snapshot = await _firestore.collection('Users').doc(userId).get();

        if (snapshot.exists) {
          setState(() {
            userDetails = snapshot.data() as Map<String, dynamic>;
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          // Handle the case if user data does not exist
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User details not found')),
          );
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching user details: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user details')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
          : userDetails == null
          ? Center(child: Text('No user details found'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Full Name: ${userDetails!['fullname']}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${userDetails!['email']}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Phone Number: ${userDetails!['phoneno']}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('User ID: ${userDetails!['uid']}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Account Created At: ${userDetails!['createdAt'].toDate()}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
