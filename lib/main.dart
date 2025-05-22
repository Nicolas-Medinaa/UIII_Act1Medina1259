import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desplazamiento de Imágenes Detallado',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const ImageDetailSliderScreen(),
    );
  }
}

class ImageDetailSliderScreen extends StatefulWidget {
  const ImageDetailSliderScreen({super.key});

  @override
  State<ImageDetailSliderScreen> createState() => _ImageDetailSliderScreenState();
}

class _ImageDetailSliderScreenState extends State<ImageDetailSliderScreen> {
  final PageController _pageController = PageController();
  final List<Map<String, String>> _imageData = [
    {
      'url':
          'https://raw.githubusercontent.com/Nicolas-Medinaa/maquetacion-Imagenes/refs/heads/main/iPhone1.jpg',
      'title': 'Golden Gate Bridge',
      'rating': '4.0 (2000)',
      'description':
          'El Puente Golden Gate es un puente colgante que cruza el estrecho de Golden Gate, el canal entre la Bahía de San Francisco y el Océano Pacífico.',
    },
    {
      'url':
          'https://raw.githubusercontent.com/Nicolas-Medinaa/maquetacion-Imagenes/refs/heads/main/iPhone2.jpg',
      'title': 'Montañas Serenas',
      'rating': '4.5 (1500)',
      'description':
          'Un paisaje montañoso impresionante con picos nevados y valles verdes, ideal para el senderismo y la exploración.',
    },
    {
      'url':
          'https://raw.githubusercontent.com/Nicolas-Medinaa/maquetacion-Imagenes/refs/heads/main/iPhone3.jpg',
      'title': 'Arquitectura Moderna',
      'rating': '4.2 (1800)',
      'description':
          'Un edificio de diseño arquitectónico moderno con líneas limpias, grandes ventanales y una estética contemporánea.',
    },
  ];
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _imageData.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    _imageData[index]['url']!,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _imageData[index]['title']!,
                            style: const TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),
                              const Icon(Icons.star, color: Colors.yellow),
                              const Icon(Icons.star, color: Colors.yellow),
                              const Icon(Icons.star, color: Colors.yellow),
                              const Icon(Icons.star_border, color: Colors.yellow),
                              const SizedBox(width: 8.0),
                              Text(
                                _imageData[index]['rating']!,
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            _imageData[index]['description']!,
                            style: const TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'READ MORE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          Positioned(
            top: 30.0,
            left: 20.0,
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, color: Colors.white),
                const SizedBox(width: 8.0),
                const Text('7:59', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            top: 30.0,
            right: 20.0,
            child: Row(
              children: [
                Text('${_currentPage + 1}/${_imageData.length}',
                    style: const TextStyle(color: Colors.white)),
                const SizedBox(width: 8.0),
                const Icon(Icons.signal_cellular_4_bar, color: Colors.white),
                const SizedBox(width: 4.0),
                const Icon(Icons.battery_full, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}