import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/loginPageWidget.dart';

class ConnectWallet extends StatefulWidget {
  const ConnectWallet({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const ConnectWallet(),
      );
  @override
  State<ConnectWallet> createState() => _ConnectWalletState();
}

class _ConnectWalletState extends State<ConnectWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            customSigninDialog(context, onClosed: (_) {});
          },
          child: Text('Open Sign In Dialog'),
        ),
      ),
    );
  }
}

Future<Object?> customSigninDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign up",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween = Tween(begin: Offset(0, -1), end: Offset.zero);
      return SlideTransition(
          position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child);
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: 620,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset:
              false, // avoid overflow error when keyboard shows up
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              ListView(children: [
                const Text(
                  "Connect Wallet",
                  style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Connect wallet with GAMESHIFT",
                    textAlign: TextAlign.center,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://preview.redd.it/announcing-gameshift-accelerating-game-development-on-solana-v0-6tgdt19ebycb1.png?width=680&format=png&auto=webp&s=b0eaf703a820ec41a27cca733850f279a9ae8044",
                  ),
                ),
                const SignInForm(),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "or register a new account",
                        style: TextStyle(color: Colors.black26),
                      ),
                    ),
                    Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 4, 245),
                        minimumSize: const Size(double.infinity, 56),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25)))),
                    icon: const Icon(
                      CupertinoIcons.arrow_right,
                      color: Color(0xFFFE0037),
                    ),
                    label: const Text(
                      "Register",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
              const Positioned(
                left: 0,
                right: 0,
                bottom: -48,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  ).then(onClosed);
}
