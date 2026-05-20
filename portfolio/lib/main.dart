import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcel Gäding - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0369A1), // Ein professionelles Dunkelblau
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Segoe UI',
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive Breakpoint
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(isMobile),
                  const SizedBox(height: 60),
                  _buildSectionTitle('Über mich'),
                  const SizedBox(height: 20),
                  const Text(
                    'Als Process Engineer mit einem M.Sc. in Mechatronik verbinde ich tiefgreifendes Prozesswissen in der Halbleiterindustrie mit moderner Software- und App-Entwicklung. Ich optimiere Fertigungsabläufe in der Mikrosystemtechnik und entwickle gleichzeitig performante Anwendungen mit Flutter und Dart.',
                    style: TextStyle(fontSize: 18, height: 1.6, color: Color(0xFF334155)),
                  ),
                  const SizedBox(height: 60),
                  _buildSectionTitle('Berufserfahrung'),
                  const SizedBox(height: 20),
                  _buildExperienceItem(
                    'Vishay Siliconix Itzehoe',
                    'Process Engineer Backmetal',
                    'Seit 08/2023',
                    'Prozessentwicklung, Optimierung und Dokumentation von Prozessabläufen sowie Implementierung von SPC-Systemen in der Halbleiterfertigung.',
                  ),
                  _buildExperienceItem(
                    'Basler AG',
                    'Electronics Production Technologist',
                    '02/2023 – 08/2023',
                    'Dokumentation kritischer Fertigungsprozesse und Entwicklung von Rework-Prozessen.',
                  ),
                  _buildExperienceItem(
                    'Fraunhofer ISIT',
                    'Mikrotechnologe',
                    '2010 – 2014',
                    'Grundsteinlegung in der Mikrosystemtechnik und Reinraum-Fertigung komplexer Halbleiter-Strukturen.',
                  ),
                  const SizedBox(height: 60),
                  _buildSectionTitle('Ausbildung'),
                  const SizedBox(height: 20),
                  _buildExperienceItem(
                    'TU Braunschweig',
                    'Master of Science: Mechatronik (Maschinenbau)',
                    '10/2019 – 12/2022',
                    'Fokus auf Simulation & Dünnschichttechnik. Abschlussnote: 1,8.',
                  ),
                  const SizedBox(height: 60),
                  _buildSectionTitle('Tech-Stack & Skills'),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      _buildSkillChip('Flutter & Dart'),
                      _buildSkillChip('App-Entwicklung'),
                      _buildSkillChip('Prozessoptimierung (SPC)'),
                      _buildSkillChip('Creo Parametric (CAD)'),
                      _buildSkillChip('3D-Druck / Prototyping'),
                      _buildSkillChip('Mikrosystemtechnik'),
                    ],
                  ),
                  const SizedBox(height: 80),
                  const Divider(),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      '© 2026 Marcel Gäding. Erstellt mit Flutter Web.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Marcel Gäding',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'M.Sc. Mechatronik | Process Engineer | Flutter Developer',
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF0369A1),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
    );
  }

  Widget _buildExperienceItem(String company, String role, String period, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  role,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ),
              Text(
                period,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            company,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0369A1),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 16, height: 1.5, color: Color(0xFF475569)),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      backgroundColor: const Color(0xFFE0F2FE),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}