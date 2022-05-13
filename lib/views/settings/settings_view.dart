import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User = FirebaseAuth.instance.currentUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatarWithTransition(
          image: NetworkImage(
            User?.photoURL ?? "https://picsum.photos/200/300",
          ),
          size: 140,
          primaryColor: Theme.of(context).colorScheme.primary,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            User?.displayName ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          User?.email ?? "",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 35,
        ),
        M3ListTile(
          onPressed: (() async {
            await FirebaseAuth.instance.signOut();
          }),
          title: Text("Logout"),
          leading: Icon(Icons.logout_rounded),
        ),
        M3ListTile(
          onPressed: (() {}),
          title: Text("More Info"),
          leading: Icon(Icons.info_outline_rounded),
        ),
        const SizedBox(
          width: double.infinity,
        )
      ],
    );
  }
}

class M3ListTile extends StatelessWidget {
  const M3ListTile({
    Key? key,
    required this.onPressed,
    this.title,
    this.leading,
  }) : super(key: key);
  final void Function() onPressed;
  final Widget? title;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onPressed,
        leading: leading,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textColor: Theme.of(context).colorScheme.onPrimaryContainer,
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        title: title,
      ),
    );
  }
}

class CircleAvatarWithTransition extends StatelessWidget {
  /// the base color of the images background and its concentric circles.
  final Color primaryColor;

  /// the profile image to be displayed.
  final ImageProvider image;

  ///the diameter of the entire widget, including the concentric circles.
  final double size;

  /// the width between the edges of each concentric circle.
  final double transitionBorderwidth;

  const CircleAvatarWithTransition(
      {Key? key,
      required this.primaryColor,
      required this.image,
      this.size = 190.0,
      this.transitionBorderwidth = 20.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.05),
          ),
        ),
        Container(
            height: size - transitionBorderwidth,
            width: size - transitionBorderwidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(stops: const [
                0.01,
                0.5
              ], colors: [
                Colors.white,
                primaryColor.withOpacity(0.1),
              ]),
            )),
        Container(
          height: size - (transitionBorderwidth * 2),
          width: size - (transitionBorderwidth * 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.4),
          ),
        ),
        Container(
          height: size - (transitionBorderwidth * 3),
          width: size - (transitionBorderwidth * 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.5),
          ),
        ),
        Container(
          height: size - (transitionBorderwidth * 4),
          width: size - (transitionBorderwidth * 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: image,
            ),
          ),
        ),
      ],
    );
  }
}
