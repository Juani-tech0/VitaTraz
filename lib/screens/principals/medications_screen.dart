import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fl_vitatraz_app/components/medication_card.dart';
import 'package:fl_vitatraz_app/theme/theme.dart';

class MedicationsScreen extends StatefulWidget {
  static const String routeName = '/medications';
  const MedicationsScreen({Key? key}) : super(key: key);

  @override
  State<MedicationsScreen> createState() => _MedicationsScreenState();
}

class _MedicationsScreenState extends State<MedicationsScreen> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  // examples
  final List<Map<String, String>> _allMeds = [
    {
      'name': 'Aspirin',
      'company': 'Bayer',
      'ingredient': 'Acetylsalicylic Acid',
      'code': 'CN B01AC06',
      'label': 'PRESCRIPTION',
      'type': 'prescription',
    },
    {
      'name': 'Aspirin',
      'company': 'Bayer',
      'ingredient': 'Acetylsalicylic Acid',
      'code': 'CN B01AC06',
      'label': 'ORPHAN',
      'type': 'orphan',
    },
    {
      'name': 'Aspirin',
      'company': 'Bayer',
      'ingredient': 'Acetylsalicylic Acid',
      'code': 'CN B01AC06',
      'label': 'PRESCRIPTION',
      'type': 'prescription',
    },
  ];

  List<Map<String, String>> _filteredMeds = [];

  @override
  void initState() {
    super.initState();
    _filteredMeds = List.from(_allMeds);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String _) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final q = _searchController.text.toLowerCase();
      setState(() {
        _filteredMeds = _allMeds.where((med) {
          return med['name']!.toLowerCase().contains(q) ||
                 med['company']!.toLowerCase().contains(q) ||
                 med['ingredient']!.toLowerCase().contains(q) ||
                 med['code']!.toLowerCase().contains(q);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Column(
        children: [
          // === HEADER ===
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            padding: EdgeInsets.only(
              top: safeTop + 20,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back arrow and metication title
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.secondaryBackground,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Medications',
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondaryBackground,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Search field and filter icon
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBackground,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search_rounded,
                              color: AppColors.secondaryText,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                onChanged: _onSearchChanged,
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  hintStyle: GoogleFonts.manrope(
                                    fontSize: 16,
                                    color: AppColors.secondaryText,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  color: AppColors.primaryText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // filters
                        },
                        icon: const Icon(Icons.tune, size: 24),
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // === MEDICATIONS LIST ===
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _filteredMeds.length,
              itemBuilder: (context, i) {
                final med = _filteredMeds[i];
                final isPresc = med['type'] == 'prescription';
                return MedicationCard(
                  name:       med['name']!,
                  company:    med['company']!,
                  ingredient: med['ingredient']!,
                  code:       med['code']!,
                  label:      med['label']!,
                  labelColor: isPresc ? AppColors.primary : AppColors.secondary,
                  onTap: () {
                    // 
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
