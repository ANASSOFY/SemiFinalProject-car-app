import 'package:car_store/screens/buy/book_now_screen.dart';
import 'package:car_store/widgets/cards/custom_search_bar.dart';
import 'package:flutter/material.dart';
import '../models/car_model.dart';
import 'cards/car_card.dart';

class ListeningPage extends StatefulWidget {

  final String brandName;

  const ListeningPage({
    super.key,
    required this.brandName,
  });

  @override
  State<ListeningPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListeningPage> {

  bool isSellerMode = false;
  String selectedLocation = "UAE";
  String sortBy = "Relevance";
  String filterBy = "All";

  final List<String> locations = ["UAE", "USA", "EGYPT", "UK", "Canada"];


  final List<Car> _allCars = [

    Car(
      id: "1",
      title: "Hyundai Elantra 2020",
      subtitle: "30,000 km - Petrol - Auto",
      price: "\$18,000",
      originalPrice: "\$21,000",
      imageUrl: "https://www.hyundai.com/content/dam/hyundai/ww/en/images/vehicles/vehicles-kv-2023-pc.jpg",
      brand: "Hyundai",
    ),

    Car(
      id: "2",
      title: "BMW M3 CS Touring 2025",
      subtitle: "40,000 km - Petrol - Auto",
      price: "\$55,000",
      originalPrice: "\$60,000",
      imageUrl: "https://s1.cdn.autoevolution.com/images/gallery/bmw-m3-cs-touring-2025-7843_23.jpg",
      brand: "BMW",
    ),

    Car(
      id: "3",
      title: "Toyota Corolla 2021",
      subtitle: "28,000 km - Petrol - Auto",
      price: "\$20,000",
      originalPrice: "\$23,000",
      imageUrl: "https://toyota.com.eg/storage/2760/conversions/image-(52)-optimized.png",
      brand: "Toyota",
    ),

    Car(
      id: "4",
      title: "Hyundai Tucson 2021",
      subtitle: "25,000 km - Diesel - Auto",
      price: "\$25,000",
      originalPrice: "\$28,000",
      imageUrl: "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg",
      brand: "Hyundai",
    ),

    Car(
      id: "5",
      title: "BMW X4 M F98 2021",
      subtitle: "35,000 km - Petrol - Auto",
      price: "\$38,000",
      originalPrice: "\$42,000",
      imageUrl: "https://s1.cdn.autoevolution.com/images/gallery/bmw-x4-m-f98-2021-7122_26.jpg",
      brand: "BMW",
    ),
    Car(
      id: "6",
      title: "BMW 320i 2019",
      subtitle: "35,000 km - Petrol - Auto",
      price: "\$38,000",
      originalPrice: "\$42,000",
      imageUrl: "https://toyota.com.eg/storage/40582/conversions/grey-resized-optimized.png",
      brand: "Toyota",
    ),
    Car(
      id: "7",
      title: "TATA  2019",
      subtitle: "35,000 km - Petrol - Auto",
      price: "\$38,000",
      originalPrice: "\$42,000",
      imageUrl: "https://stimg.cardekho.com/images/carexteriorimages/930x620/Tata/Sierra/12271/1765181428462/exterior-image-165.jpg",
      brand: "Tata",
    ),
    Car(
      id: "8",
      title: "BMW 320i 2019",
      subtitle: "35,000 km - Petrol - Auto",
      price: "\$38,000",
      originalPrice: "\$42,000",
      imageUrl: "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg",
      brand: "BMW",
    ),

  ];

  // ===== FILTER BY BRAND =====

  List<Car> get filteredCars {
    return _allCars
        .where((car) => car.brand == widget.brandName)
        .toList();
  }

  // ===== FUNCTIONS =====

  void _userMode() {
    setState(() {
      isSellerMode = !isSellerMode;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Switched to ${isSellerMode ? 'Seller' : 'Buyer'} mode"),
      ),
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Sort By", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile(
              title: const Text("Price: Low to High"),
              onTap: () {
                setState(() => sortBy = "Price Low");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Price: High to Low"),
              onTap: () {
                setState(() => sortBy = "Price High");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Newest First"),
              onTap: () {
                setState(() => sortBy = "Newest");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Filter By Brand", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile(
              title: const Text("Hyundai"),
              onTap: () {
                setState(() => filterBy = "Hyundai");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("BMW"),
              onTap: () {
                setState(() => filterBy = "BMW");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Toyota"),
              onTap: () {
                setState(() => filterBy = "Toyota");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _changeLocation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Location"),
        content: DropdownButton<String>(
          value: selectedLocation,
          isExpanded: true,
          items: locations.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              setState(() => selectedLocation = newValue);
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }

  // ===== UI =====

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(widget.brandName, style: const TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.amber),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomSearchBar(),
          ),

          const SizedBox(height: 15),

          // Filter Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // _buildActionButton(icon: Icons.tune, label: "Filters", onTap: _showFilterOptions),
                const SizedBox(width: 10),
                _buildActionButton(icon: Icons.swap_vert, label: "Sort", color: const Color(0xFFFFE082), onTap: _showSortOptions),
                const Spacer(),
                GestureDetector(
                  onTap: _changeLocation,
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        "Change location ($selectedLocation)",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: filteredCars.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {

                final car = filteredCars[index];

                return CarCard(
                  name: car.title,
                  details: car.subtitle,
                  price: car.price,
                  imageUrl: car.imageUrl,
                  onBuyTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BookNowScreen(name: car.title, details: car.subtitle, price: car.price, imageUrl: car.imageUrl)));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Buying ${car.title}")),
                    );
                  },
                  onFavoriteTap: () {
                    setState(() => car.isFavorite = !car.isFavorite);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    Color? color,
    required VoidCallback onTap,
  }) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: color == null ? Border.all(color: Colors.grey.shade300) : null,
        ),
        child: Row(
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
