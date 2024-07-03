
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gift_shop_christmas/gift.dart';

// ignore: use_key_in_widget_constructors
class GiftShop extends StatelessWidget {
  final List<Gift> gifts = [
    Gift(name: "Cadeau 1", image: "assets/images/gift1.jpg", price: 10.0),
    Gift(name: "Cadeau 2", image: "assets/images/gift2.jpg", price: 15.0),
    Gift(name: "Cadeau 3", image: "assets/images/gift1.jpg", price: 20.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boutique de Cadeaux Virtuelle'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          CarouselSlider(
            items: gifts.map((gift) => GiftCard(gift: gift)).toList(),
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16/9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          const SizedBox(height: 20),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('Choisis le cadeau parfait!'),
            ],
            isRepeatingAnimation: false,
            // onTap: () {
            //   print("Animation tapped!");
            // },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Logique d'achat ici
            },
            child: const Text('Ajouter au panier'),
          ),
        ],
      ),
    );
  }
}

class GiftCard extends StatelessWidget {
  final Gift gift;

  const GiftCard({super.key, required this.gift});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            Image.asset(gift.image, height: 120, width: 150, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(gift.name),
            Text('\$${gift.price.toString()}'),
          ],
        ),
      ),
    );
  }
}