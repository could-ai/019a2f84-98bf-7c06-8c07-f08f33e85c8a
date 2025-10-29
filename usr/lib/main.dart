import 'package:flutter/material.dart';

void main() {
  runApp(const FootballApp());
}

class FootballApp extends StatelessWidget {
  const FootballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق كرة القدم',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      // Set the app's text direction to right-to-left for Arabic
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dummy data for matches
  final List<Map<String, String>> matches = [
    {"title": "مباراة ودية في ملعب الجامعة", "time": "الساعة 7:00 مساءً", "players": "8/10"},
    {"title": "تحدي الأبطال", "time": "الساعة 8:30 مساءً", "players": "10/12"},
    {"title": "مباراة في ملعب النجوم", "time": "الساعة 9:00 مساءً", "players": "5/10"},
    {"title": "لقاء الأصدقاء", "time": "الساعة 10:00 مساءً", "players": "12/12"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المباريات المتاحة'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 5.0,
            child: ListTile(
              leading: const Icon(Icons.sports_soccer, color: Colors.green, size: 40),
              title: Text(match['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${match['time']!} - اللاعبون: ${match['players']!}"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  // Placeholder for join match functionality
                },
                child: const Text('انضم'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder for create match functionality
        },
        backgroundColor: Colors.green[800],
        child: const Icon(Icons.add),
      ),
    );
  }
}
