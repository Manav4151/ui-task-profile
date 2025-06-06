import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> galleryImages = [
    'assets/images/gallery_img1.png',
    'assets/images/gallery_img2.jpg',
    'assets/images/gallery_img3.png',
    'assets/images/gallery_img4.jpg',
    'assets/images/gallery_img5.avif',
    'assets/images/gallery_img6.jpg',
  ];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isPortrait ? 24.0 : 12.0,
          vertical: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              isPortrait
                  ? Column(
                      children: profileHeader(context, isPortrait),
                    )
                  : Row(
                     
                      children: [
                        CircleAvatar(
                          radius: min(size.height * 0.10, 60),
                          backgroundImage: const AssetImage('assets/images/profile.png'),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: profileHeader(context, isPortrait),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 16),
              Text(
                "Portrait photographer passionate about capturing genuine expressions, subtle emotions, and the untold stories that make each individual unique. Open to collaborations, creative projects, and portrait sessions tailored to your vision.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isPortrait ? 16 : 14,
                ),
              ),
              const SizedBox(height: 24),
              sectionTitle("Specialties"),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  specialtyChip("Photography"),
                  specialtyChip("Landscape"),
                  specialtyChip("Portraits"),
                ],
              ),
              const SizedBox(height: 24),
              sectionTitle("Gallery"),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: galleryImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isPortrait ? 2 : 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  // mainAxisExtent: size.height * 0.20,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(galleryImages[index], fit: BoxFit.cover),
                  );
                },
              ),
              const SizedBox(height: 24),
              sectionTitle("Awards"),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  awardCard("Best Landscape Photographer 2023"),
                  awardCard("Top 10 Portraits in India 2022"),
                  awardCard("Wildlife Photography Award 2021"),
                ],
              ),
              const SizedBox(height: 24),
              sectionTitle("Socials"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  socialIcon("Instagram", "assets/images/instagram.png"),
                  socialIcon("Twitter", "assets/images/twitter.png"),
                  socialIcon("Facebook", "assets/images/fb.png"),
                ],
              ),
              const SizedBox(height: 24),
              
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> profileHeader(BuildContext context, bool isPortrait) {
    final size = MediaQuery.of(context).size;

    return [
      if (isPortrait)
        CircleAvatar(
          radius: min(size.width * 0.19, 80),
          backgroundImage: const AssetImage('assets/images/profile.png'),
        ),
      const SizedBox(height: 12),
      const Text(
        "Lucy Sherman",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 4),
      const Text(
        "Photographer",
        style: TextStyle(fontSize: 18, color: Colors.white70),
      ),
      const Text(
        "Mumbai, India",
        style: TextStyle(fontSize: 16, color: Colors.white60),
      ),
      const SizedBox(height: 12),
      Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Connect",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ];
  }
}
  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget specialtyChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget socialIcon(String name, String assetPath) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: secondaryColor,
          radius: 30,
          child: Image.asset(assetPath, scale: 16),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
 
  Widget awardCard(String name) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white24, width: 1),
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: cardColor,
          radius: 28,
          child: const Icon(Icons.emoji_events, color: Colors.amber, size: 30),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
        ),
      ],
    ),
  );
}
