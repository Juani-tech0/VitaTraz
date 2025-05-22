import 'package:flutter/material.dart';
import 'package:fl_vitatraz_app/theme/theme.dart';
import 'package:fl_vitatraz_app/components/components.dart';
import 'package:fl_vitatraz_app/screens/principals/medications_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Encabezado
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Welcome', style: Theme.of(context).textTheme.headlineMedium),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 30, height: 30,
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryText, shape: BoxShape.circle
                      ),
                      child: const Icon(Icons.account_circle,
                          color: AppColors.secondaryBackground, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25), topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    children: [
                      // Tarjetas superiores
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
                                      Navigator.pushNamed(
                                        context,
                                        MedicationsScreen.routeName,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: WidgetCard(
                                    title: 'Medical records',
                                    subtitle: '',
                                    icon: Icons.folder_shared,
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            WidgetCard(
                              title: 'Patients',
                              subtitle: '45 assigned patients',
                              icon: Icons.people,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Sección TO DO
                      TodoListHeader(onAdd: () {}),

                      // Recordatorios
                      Column(
                        children: [
                          RecordatorioTile(
                            imageUrl: 'https://img.freepik.com/free-photo/abstract-geometric-background-shapes-texture_1194-301824.jpg?semt=ais_hybrid&w=740',
                            title: 'Abaaddn sdksjnsjed csd cd',
                            label: '02/05   14:30',
                            onComplete: () {},
                          ),
                          RecordatorioTile(
                            imageUrl: 'https://img.freepik.com/free-photo/abstract-geometric-background-shapes-texture_1194-301824.jpg?semt=ais_hybrid&w=740',
                            title: 'AKS sdmaa wias sja dj as askld',
                            label: '33/33   33:33',
                            onComplete: () {},
                          ),
                        ],
                      ),
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
