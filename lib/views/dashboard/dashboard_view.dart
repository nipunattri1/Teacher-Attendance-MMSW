import 'package:flutter/material.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Card()),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4 -
                    kToolbarHeight -
                    16 -
                    kBottomNavigationBarHeight,
                width: MediaQuery.of(context).size.width * 0.5 - 16,
                child: const Card(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4 -
                    kToolbarHeight -
                    16 -
                    kBottomNavigationBarHeight,
                width: MediaQuery.of(context).size.width * 0.5 - 16,
                child: const Card(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
