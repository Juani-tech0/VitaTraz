import 'package:flutter/material.dart';

import 'package:fl_vitatraz_app/theme/theme.dart';
import 'package:fl_vitatraz_app/components/components.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryText,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.account_circle,
                          color: AppColors.secondaryBackground,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      // -------------------
                      // Tarjetas superiores
                      // -------------------
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: WidgetCard(
                                    title: 'Medications',
                                    subtitle: '150 Approved drugs',
                                    icon: Icons.medication,
                                    onTap: () {
                                      // navegar a Medications
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: WidgetCard(
                                    title: 'Medical records',
                                    subtitle: '',
                                    icon: Icons.folder_shared,
                                    onTap: () {
                                      // navegar a Medical Records
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            WidgetCard(
                              title: 'Patients',
                              subtitle: '45 assigned patients',
                              icon: Icons.people,
                              onTap: () {
                                // navegar a Patients
                              },
                            ),
                          ],
                        ),
                      ),

                      // -------------------
                      // Sección TO DO
                      // -------------------
                      TodoListHeader(
                        onAdd: () {
                          // añadir nuevo recordatorio
                        },
                      ),

                      // -------------------
                      // Lista de recordatorios
                      // -------------------
                      Column(
                        children: [
                          RecordatorioTile(
                            imageUrl:
                                'https://media.istockphoto.com/id/1413811459/vector/back-to-school-seamless-pattern.jpg?s=612x612&w=0&k=20&c=8UB-TzASycU7hV1kRL5RRCsL5T-krisF6g8F9roxVk4=',
                            title:
                                '...',
                            label: '02/05   14:30',
                            onComplete: () {
                              // marcar como completado
                            },
                          ),
                          RecordatorioTile(
                            imageUrl:
                                'https://media.istockphoto.com/id/1413811459/vector/back-to-school-seamless-pattern.jpg?s=612x612&w=0&k=20&c=8UB-TzASycU7hV1kRL5RRCsL5T-krisF6g8F9roxVk4=',
                            title:
                                '...',
                            label: '33/33   33:33',
                            onComplete: () {
                              // marcar como completado
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
