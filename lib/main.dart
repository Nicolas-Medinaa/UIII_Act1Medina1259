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
      'title': 'IPhone Pro Max 16',
      'rating': '4.0 (2000)',
      'description':
          'El iPhone 16 Pro Max llega a ofrecer mas en potencia como en modernidad, crea una interfaz tan comoda como funcional para todos',
    },
    {
      'url':
          'https://raw.githubusercontent.com/Nicolas-Medinaa/maquetacion-Imagenes/refs/heads/main/iPhone2.jpg',
      'title': 'iPhone Pro 15',
      'rating': '4.0 (1500)',
      'description':
          'Un dispositivo versatil en empresas profesionales como para uso propio, este telefono ofrece una gran potencia por un precio accesible',
    },
    {
      'url':
          'https://raw.githubusercontent.com/Nicolas-Medinaa/maquetacion-Imagenes/refs/heads/main/iPhone3.jpg',
      'title': 'iPhone 14',
      'rating': '4.2 (1800)',
      'description':
          'Un telefono tan lindo y moderno que llega a ofrecer mas en potencia como en modernidad, crea una interfaz tan comoda como funcional para todos',
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