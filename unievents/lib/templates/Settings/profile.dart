import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:unievents/wigets/input.dart';
import 'package:unievents/wigets/MyButton.dart';
import 'package:unievents/themes/themes.dart';
import 'package:unievents/SQLite/database_helper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _eventTitle = TextEditingController();
  final _eventDiscription = TextEditingController();
  final _otherType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Retrieve the current user from the DatabaseHelper using Provider
    final auth = Provider.of<DatabaseHelper>(context);
    
    // Check if currentUser is not null, else display 'Guest'
    // final currentUser = auth.currentUser;
    // final username = currentUser != null ? currentUser.usrName : 'Guest';

    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          const Expanded(flex: 1, child: _TopPortion()),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    // username, // Display the username
                    'hhh',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  MyInput(
                    controller: _eventTitle,
                    hint: 'Username',
                    title: 'Username',
                  ),
                  MyInput(
                    controller: _eventTitle,
                    hint: 'Enter Event Title',
                    title: 'Email',
                  ),
                  MyInput(
                    controller: _eventTitle,
                    hint: 'Enter Event Title',
                    title: 'Password',
                  ),
                  MyButton(
                    label: "Save",
                    onTap: null,
                    visibility: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [secondaryColor, Color.fromARGB(255, 152, 238, 218)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/default.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

AppBar _appBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      onPressed: () => Get.back(),
    ),
    title: const Text('Profile'),
    centerTitle: true,
  );
}
