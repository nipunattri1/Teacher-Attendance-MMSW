import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_attendance/controllers/add_inital_data/add_user_data.dart';

class Initializing extends StatelessWidget {
  const Initializing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        width: double.infinity,
        child: FutureBuilder(
          future: addUserData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("We are done 😃"),
                  ElevatedButton(
                    onPressed: (() => Navigator.of(context).pop()),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Continue"),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset("assets/lottie/rocket-animation.json"),
              );
            } else {
              return Container(
                width: 100,
                height: 100,
                color: Colors.red,
              );
            }
          },
        ),
      ),
    );
  }
}
