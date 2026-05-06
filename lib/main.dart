import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workshop App',

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        primaryColor: Colors.indigo,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        cardColor: const Color(0xFF1E293B),
      ),

      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      home: WorkshopPage(
        isDark: isDark,
        onToggle: () {
          setState(() {
            isDark = !isDark;
          });
        },
      ),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggle;

  const WorkshopPage({
    super.key,
    required this.isDark,
    required this.onToggle,
  });

  final List<Map<String, String>> workshopList = const [
    {
      "judul": "Workshop Flutter",
      "tanggal": "10 Mei 2026",
      "lokasi": "Lab Komputer",
      "kuota": "30"
    },
    {
      "judul": "Workshop UI/UX",
      "tanggal": "12 Mei 2026",
      "lokasi": "Aula Kampus",
      "kuota": "25"
    },
    {
      "judul": "Workshop AI Dasar",
      "tanggal": "15 Mei 2026",
      "lokasi": "Online Zoom",
      "kuota": "50"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Workshop Kampus"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo,

        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggle,
          )
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: isDarkMode
              ? const LinearGradient(
                  colors: [Color(0xFF0F172A), Color(0xFF020617)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : const LinearGradient(
                  colors: [Color(0xFFF5F7FB), Color(0xFFE9ECF5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
        ),

        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: workshopList.length,
          itemBuilder: (context, index) {
            final data = workshopList[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 18),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.indigo.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.event,
                                color: Colors.indigo),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: Text(
                              data["judul"]!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "${data["kuota"]}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(data["tanggal"]!),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(data["lokasi"]!),
                        ],
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  "Berhasil daftar ${data["judul"]}",
                                ),
                              ),
                            );
                          },
                          child: const Text("Daftar Sekarang"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}