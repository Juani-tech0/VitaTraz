import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_vitatraz_app/theme/theme.dart';

class MedicationCard extends StatelessWidget {
  final String name;
  final String company;
  final String ingredient;
  final String code;
  final String label;
  final Color labelColor;
  final VoidCallback? onTap;

  const MedicationCard({
    Key? key,
    required this.name,
    required this.company,
    required this.ingredient,
    required this.code,
    required this.label,
    required this.labelColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.secondaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              Text(
                name,
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 4),

              // Compañía
              Text(
                company,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 4),

              // Ingrediente
              Text(
                ingredient,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 8),

              // Código y etiqueta
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    code,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: labelColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      label,
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondaryBackground,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
