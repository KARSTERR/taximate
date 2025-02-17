import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [
                OnboardingScreen(
                  image: 'assets/images/taxi1.jpg',
                  title: 'TaxiMate’e Hoş Geldiniz.',
                  description: 'Şehirde daha akıllı bir şekilde dolaşmanın yolunu ride-sharing uygulamamızla keşfedin.',
                ),
                OnboardingScreen(
                  image: 'assets/images/taxi2.jpg',
                  title: 'Adil ve Şeffaf Maliyetler',
                  description: 'Dinamik ve şeffaf fiyatlandırma ile sadece seyahat ettiğiniz mesafe için ödeme yapın',
                ),
                OnboardingScreen(
                  image: 'assets/images/taxi3.jpg',
                  title: 'Hızlı ve Verimli Yolculuklar',
                  description: 'Gerçek zamanlı rota optimizasyonu ile daha kısa seyahat sürelerinin keyfini çıkarın.',
                ),
                OnboardingScreen(
                  image: 'assets/images/taxi4.jpg',
                  title: 'Güvenli ve Güvenilir',
                  description: 'Güvenli ödeme ve onaylanmış sürücülerle endişesiz seyahat edin',
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 4,
            effect: WormEffect(
              dotHeight: 8.0,
              dotWidth: 8.0,
              spacing: 16.0,
              dotColor: Colors.grey,
              activeDotColor: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_currentPage == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        },
        child: Icon(_currentPage == 3 ? Icons.check : Icons.arrow_forward),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Image with rounded bottom corners
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.6, // Adjust height
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 24),
        // Title and description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}