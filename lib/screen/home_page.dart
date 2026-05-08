import 'package:flutter/material.dart';
import 'package:animals_sounds/components/animal_button.dart';
import 'package:animals_sounds/models/animals_model.dart';

class HomePage extends StatelessWidget {
  final List<AnimalModel> animals = [
    AnimalModel(image: 'assets/images/lion.jpg', sound: 'sounds/lion.mp3'),

    AnimalModel(
      image: 'assets/images/elephant.jpg',
      sound: 'sounds/elephant.mp3',
    ),

    AnimalModel(image: 'assets/images/dog.jpg', sound: 'sounds/dog.mp3'),

    AnimalModel(image: 'assets/images/horse.jpg', sound: 'sounds/horse.mp3'),
    AnimalModel(image: 'assets/images/wolf.jpg', sound: 'sounds/wolf.mp3'),

    AnimalModel(image: 'assets/images/camel.jpg', sound: 'sounds/camel.mp3'),

    AnimalModel(image: 'assets/images/zebra.jpg', sound: 'sounds/zebra.mp3'),

    AnimalModel(image: 'assets/images/bison.jpg', sound: 'sounds/bison.mp3'),
  ];
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return // ⭐ مهم جدًا
    Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text(
          'Animals Sounds',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tree.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Container(
          color: Colors.black.withOpacity(0.25),

          child: SafeArea(
            // ⭐ مهم جدًا
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              itemCount: animals.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return AnimalButton(animal: animals[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
