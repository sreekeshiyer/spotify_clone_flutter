import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';

class LaunchScreen extends StatefulWidget {
  static const String id = 'launch_screen';
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LaunchScreenState();
  }
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('images/spotify_white.png'),
              width: 70,
              height: 70,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                'Millions of songs.\nFree on Spotify.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: ElevatedButton(
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 30),
                    primary: Colors.green,
                    shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: OutlinedButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: const Image(
                          image: AssetImage('images/google.png'),
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 7,
                      child: Text(
                        'Continue with Google',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size(300, 30),
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    textStyle: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: OutlinedButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: const Image(
                          image: AssetImage('images/facebook.png'),
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 7,
                      child: Text(
                        'Continue with Facebook',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size(300, 30),
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                    textStyle: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: OutlinedButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: const Image(
                          image: AssetImage('images/apple.png'),
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 7,
                      child: Text(
                        'Continue with Apple',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size(300, 30),
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
                    textStyle: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextButton(
                child: const Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                style: TextButton.styleFrom(
                    minimumSize: const Size(300, 30),
                    primary: Colors.transparent,
                    shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    textStyle: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
