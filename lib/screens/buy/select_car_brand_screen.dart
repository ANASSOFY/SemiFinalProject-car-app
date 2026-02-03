import 'package:car_store/screens/profile/profile_screen.dart';
import 'package:car_store/widgets/cards/custom_search_bar.dart';
import 'package:car_store/widgets/listening_page.dart';
import 'package:flutter/material.dart';

class SelectCarBrandScreen extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController roleController;

  const SelectCarBrandScreen({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.roleController,
  });

  @override
  State<SelectCarBrandScreen> createState() => _SelectCarBrandScreenState();
}

class _SelectCarBrandScreenState extends State<SelectCarBrandScreen> {
  int _currentIndex = 0;

  static const List<String> brandImages = [
    "assets/images/hyundai.png",
    "assets/images/tata.png",
    "assets/images/honda.png",
    "assets/images/bmw.png",
    "assets/images/audi.png",
    "assets/images/toyota.png",
  ];

  static const List<String> brandNames = [
    "Hyundai",
    "Tata",
    "Honda",
    "BMW",
    "Audi",
    "Toyota",
  ];

  static const List<String> suggestionImages = [
    "assets/images/redcar.jpg",
    "assets/images/testcar.jpg",
    "assets/images/driving.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
       automaticallyImplyLeading: false,
        title: const Text(
          "Select Car Brand",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          const Icon(Icons.notifications_none_outlined,
              color: Colors.black, size: 28),
          const SizedBox(width: 16),
          const Icon(Icons.info_outline_rounded,
              color: Colors.black, size: 28),
          const SizedBox(width: 16),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfilePage(
                    nameController: widget.nameController,
                    emailController: widget.emailController,
                    phoneController: widget.phoneController,
                    role: '',
                  ),
                ),
              );
            },
            child: const Icon(Icons.person, color: Colors.black, size: 28),
          ),
          const SizedBox(width: 12),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomSearchBar(),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: brandImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ListeningPage(
                            brandName: brandNames[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          brandImages[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// 🧾 Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Buy in 3 easy steps",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final steps = [
                  {
                    "title": "Choose Your Car",
                    "desc":
                        "Browse cars from top brands and choose the one that fits your needs.",
                  },
                  {
                    "title": "Schedule Test Drive",
                    "desc":
                        "Pick a date and time to experience the car before buying.",
                  },
                  {
                    "title": "Complete Purchase",
                    "desc":
                        "Finish the process easily with secure payment options.",
                  },
                ];

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        suggestionImages[index],
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step ${index + 1}: ${steps[index]['title']}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            steps[index]['desc']!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _currentIndex = index);

          switch (index) {
            case 0:
              // Home
              break;
            case 1:
              // Love
              break;
            case 2:
              // Help
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Love",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: "Help",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "shop",
          ),
        ],
        
      ),
    );
  }
}
