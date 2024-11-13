import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double fontSize = 10;

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/user.png'),  
        ),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(fontSize / 2),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 72, 72, 72).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(
              color: Color.fromARGB(255, 249, 249, 249),
              width: fontSize / 10,
            ),
          ),
          padding: EdgeInsets.all(fontSize / 2),
          alignment: Alignment.center,
          child: Text(
            'Welcome Fahmi, how’s your day?',
            style: GoogleFonts.actor(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 53, 54, 59),
                  Color.fromARGB(255, 83, 83, 83),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Rp. 14.200.000,00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Text("Add E-Cash", style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 2),
                          Icon(Icons.add, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "StarPoint 1.000.000,00",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("PayLater - Activate", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "You spend Rp. 8.980.000,00 this month.",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildSection("Connection", [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 3) {
                  return _buildProfileIcon(null, "");
                } else {
                  List profileNames = ["User", "User", "User"];
                  List profileImages = ['assets/user.png', 'assets/user.png', 'assets/user.png'];
                  return _buildProfileIcon(profileImages[index], profileNames[index]);
                }
              },
            ),
          ]),
          const SizedBox(height: 20),
          // Action Buttons Section
          _buildSection("Actions", [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                List icons = [
                  Icons.attach_money_outlined,
                  Icons.swap_horiz_sharp,
                  Icons.call_split,
                  Icons.car_rental_rounded,
                  Icons.where_to_vote_outlined,
                ];
                List labels = ["Sell cars", "Trade cars", "Tf E-Cash", "Buy cars", "Car Meet"];
                return _buildActionButton(icons[index], labels[index]);
              },
            ),
          ]),
          const SizedBox(height: 20),
          _buildSection("News", [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                List newsImages = [
                  'assets/Imx2024.jpg', 
                  'assets/GIIAS.webp',
                  'assets/diesel.jpg',
                  'assets/Triton.jpg',
                ];
                return Image.asset(
                  newsImages[index], 
                  fit: BoxFit.cover,
                );
              },
            ),
          ]),
          _buildSection("Maintenance", [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 9,
                mainAxisSpacing: 9,
                childAspectRatio: 1,
              ),
              itemCount: 7,
              itemBuilder: (context, index) {
                List paymentIcons = [
                  Icons.miscellaneous_services_outlined,
                  Icons.oil_barrel_outlined,
                  Icons.car_repair_sharp,
                  Icons.garage_sharp,
                  Icons.car_crash_outlined,
                  Icons.electric_car_outlined,
                  Icons.speed,
                ];
                List paymentLabels = [
                  "Service",
                  "AutoParts",
                  "Spooring",
                  "Modification",
                  "Repair",
                  "Electronic",
                  "Performance",
                ];
                return _buildPaymentIcon(paymentIcons[index], paymentLabels[index]);
              },
            ),
          ]),
          const SizedBox(height: 20),
          _buildSection("Popular", [
            Container(
              height: 100, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal, 
                itemCount: 3,
                itemBuilder: (context, index) {
                  List newsImages = [
                    'assets/GR 86.png', 
                    'assets/GR supra.png',
                    'assets/LS500.webp',
                  ];
                  return Container(
                    width: 150, 
                    margin: EdgeInsets.symmetric(horizontal: 5), 
                    child: Image.asset(
                      newsImages[index], 
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 58, 203, 229),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSection(String title, List children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildProfileIcon(String? imagePath, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: imagePath != null ? AssetImage(imagePath) : null,
          backgroundColor: Colors.grey[800],
          child: imagePath == null ? Icon(Icons.add, color: Colors.white) : null,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  

  Widget _buildPaymentIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
