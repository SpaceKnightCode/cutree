import 'package:cutree/login_screen.dart';
import 'package:cutree/new_user_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Material(
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  padding: const EdgeInsets.only(right: 2),
                  height: 45,
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: FilledButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                          foregroundColor: Colors.grey.shade800,
                          backgroundColor: Colors.grey.shade800),
                      child: const Icon(
                        size: 20,
                        weight: 30,
                        color: Colors.white,
                        Icons.arrow_back_rounded,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Create your free account",
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -2,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //inside the scrollview
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade900),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            height: 45,
                            child: Row(
                              children: [
                                Expanded(
                                  child: FloatingActionButton(
                                    heroTag: null,
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    onPressed: () {},
                                    child: Row(
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.apple),
                                        Expanded(
                                          child: Center(
                                            child: Text("Continue with Apple"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade900),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            height: 45,
                            child: Row(
                              children: [
                                Expanded(
                                  child: FloatingActionButton(
                                    heroTag: null,
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            height: 26,
                                            width: 26,
                                            child: Image.asset(
                                                'assets/icons/google-logo.png')),
                                        const Expanded(
                                          child: Center(
                                            child: Text("Continue with Google"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                    thickness: 0.7,
                                    color: Colors.grey.shade900),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: const Text(
                                  "OR",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.shade900,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                " *",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade900,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black,
                            ),
                            child: TextField(
                              controller: emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                border: InputBorder.none,
                                hintText: 'Enter an email',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: const [
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                " *",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade900),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black,
                            ),
                            child: TextField(
                              controller: passwordController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Choose a password',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.only(left: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "Already have an account ?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    );
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.lightGreen),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 45,
                                  child: FloatingActionButton(
                                    heroTag: null,
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      signUp();
                                    },
                                    child: const Text("Continue with Email"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address and password'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final emailRegExp = RegExp(r'''
  ^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+   # local-part
  @[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])? # domain
  (?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$ # TLD
''', multiLine: true, caseSensitive: false);

    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 6 characters'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: const Text('This email is already in use.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Text("Login Instead"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: Text('An error occurred: ${e.message}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    )
                  ],
                ));
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text('An error occurred: ${e.toString()}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  )
                ],
              ));
    }
  }
}
