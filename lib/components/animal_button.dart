import 'package:flutter/material.dart';
import 'package:animals_sounds/models/animals_model.dart';
import 'package:audioplayers/audioplayers.dart';

class AnimalButton extends StatefulWidget {
  final AnimalModel animal;

  const AnimalButton({super.key, required this.animal});

  @override
  State<AnimalButton> createState() => _AnimalButtonState();
}

class _AnimalButtonState extends State<AnimalButton>
    with SingleTickerProviderStateMixin {
  final player = AudioPlayer();

  double scale = 1.0;
  double glow = 0.0;

  void playSound() async {
    setState(() {
      scale = 0.85;
      glow = 1.0;
    });

    await player.stop();
    await player.play(AssetSource(widget.animal.sound));

    Future.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) return;

      setState(() {
        scale = 1.0;
        glow = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 150),
      scale: scale,
      child: GestureDetector(
        onTap: playSound,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 🌟 Glow Effect
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: glow == 1.0
                    ? [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.8),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ]
                    : [],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.animal.image,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 🔊 Icon animation
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: glow,
              child: const Icon(Icons.volume_up, color: Colors.white, size: 40),
            ),
          ],
        ),
      ),
    );
  }
}
