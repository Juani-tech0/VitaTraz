
import 'package:flutter/material.dart';

import 'package:fl_vitatraz_app/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavTap(int idx) {
    setState(() => _currentIndex = idx);
    // Navigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          'Welcome',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: AppColors.secondaryBackground,
              size: 28,
            ),
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const HealthySnackSheet(),
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FeatureCard(
                              imageUrl:
                                  'https://storage.googleapis.com/.../med-removebg-preview.png',
                              title: 'Medications',
                              subtitle: '150 Approved drugs',
                              onTap: () {
                                // navegation to Medications
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: FeatureCard(
                              imageUrl:
                                  'https://storage.googleapis.com/.../guakala-removebg-preview.png',
                              title: 'Medical records',
                              subtitle: '',
                              onTap: () {
                                // navegation to Medical records
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      LargeFeatureCard(
                        imageUrl:
                            'https://storage.googleapis.com/.../sdqqqqqqqqqqqqqqq.png',
                        title: 'Patients',
                        subtitle: '45 assigned patients',
                        onTap: () {
                          // navegation to Patients
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TO DO',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary,
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: AppColors.secondaryBackground,
                      onPressed: () {
                        // 
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: const [
                  TodoItem(
                    imageUrl:
                        'https://storage.googleapis.com/.../Captura_de_pantalla_2025-05-01_151434.png',
                    title:
                        'Invitar a la juani a kfc para que no me regañe por inútil',
                    timeLabel: '02/05   14:30',
                  ),
                  SizedBox(height: 12),
                  TodoItem(
                    imageUrl:
                        'https://storage.googleapis.com/.../Captura_de_pantalla_2024-04-28_204753.png',
                    title:
                        '33 columnas 33 de altura busca la geometría en la arquitectura',
                    timeLabel: '33/33   33:33',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      //
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
        backgroundColor: AppColors.secondaryBackground,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.medical_services, 1),
          _buildNavItem(Icons.folder, 2),
          _buildNavItem(Icons.person, 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData iconData, int index) {
    final isActive = _currentIndex == index;
    return BottomNavigationBarItem(
      icon: isActive
          ? Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: AppColors.secondaryBackground),
            )
          : Icon(iconData, color: AppColors.primary),
      label: '',
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String imageUrl, title, subtitle;
  final VoidCallback onTap;

  const FeatureCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(imageUrl, width: 36, height: 36, fit: BoxFit.contain),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      color: AppColors.secondaryText,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}

class LargeFeatureCard extends StatelessWidget {
  final String imageUrl, title, subtitle;
  final VoidCallback onTap;

  const LargeFeatureCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryText,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                          color: AppColors.secondaryText,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final String imageUrl, title, timeLabel;
  const TodoItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.timeLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryText,
                            ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeLabel,
                    style:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 12,
                              color: AppColors.secondaryText,
                            ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text('Complete'),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthySnackSheet extends StatelessWidget {
  const HealthySnackSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, -3))
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0.7, 1.3),
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryBackground,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'healthy snack\nsuggestion',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Feeling hungry? Try eating an apple for a nutritious and fiber-rich option to help stabilize your glucose levels.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.primaryText),
                    ),
                  ],
                ),
                Align(
                  alignment: const Alignment(1.1, 1.1),
                  child: Image.asset(
                    'assets/images/apple-alpha.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.secondaryText, side: BorderSide.none,
                  backgroundColor: AppColors.secondaryBackground,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text('Skip'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  'Done',
                  style:
                      TextStyle(color: AppColors.secondaryBackground),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

