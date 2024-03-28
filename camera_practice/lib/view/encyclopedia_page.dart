import 'package:flutter/material.dart';

class EncyclopediaPage extends StatefulWidget {
  const EncyclopediaPage({Key? key});

  @override
  State<EncyclopediaPage> createState() => _EncyclopediaPageState();
}

class _EncyclopediaPageState extends State<EncyclopediaPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('도감'),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/fish.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/fish.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/fish.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/fish.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/fish.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/fish.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/fish.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/fish.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/fish.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                // Repeat the similar structure for other rows
              ],
            ),
          ],
        ),
      ),
    );
  }
}
