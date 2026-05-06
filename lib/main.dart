import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workshop App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const WorkshopPage(),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  const WorkshopPage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workshop Kampus"),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workshopList.length,
        itemBuilder: (context, index) {
          final data = workshopList[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 18),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            data["judul"]!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "${data["kuota"]} slot",
                            style: const TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 18, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          data["tanggal"]!,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 18, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          data["lokasi"]!,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),
                    const Divider(),

                    const SizedBox(height: 10),

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
                                "Berhasil daftar ${data["judul"]}!",
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Daftar Sekarang",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}