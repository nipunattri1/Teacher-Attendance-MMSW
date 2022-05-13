import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotAuth extends StatelessWidget {
  const NotAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .6,
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Placeholder(),
            ),
          ),
          Text(
            "You are not authorized to use this app",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Only Manav Mangal School users are allowed to use this app, please login with a manavmangalschool.com email address",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 46,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.logout),
                      ),
                      Text("Logout"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
