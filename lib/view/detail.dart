import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../model/detailgame.dart';
import '../viewmodel/fetchgame.dart';

class Detail extends StatelessWidget {
  final int gameTerpilih;

  const Detail({super.key, required this.gameTerpilih});

  Future<DetailGame> fetchData() async {
    final jsonData = await fetchDataFromAPI(gameTerpilih);
    return DetailGame.fromJson(jsonData);
  }

  Row _requirementRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(title, style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.w600, fontSize: 13)),
        ),
        const Expanded(
          flex: 1,
          child: Text(':', style: TextStyle(color: Colors.white70)),
        ),
        Expanded(
          flex: 8,
          child: Text(value, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DetailGame>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(color: Colors.cyanAccent));
          }
          final game = snapshot.data!;
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        game.thumbnail,
                        fit: BoxFit.cover,
                        height: 220,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.cyanAccent.withOpacity(0.5)),
                            ),
                            child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.cyanAccent, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          game.title,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1B2838),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Minimum System Requirements",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              _requirementRow("OS", game.minimumSystemRequirements.os),
                              const SizedBox(height: 4),
                              _requirementRow("Processor", game.minimumSystemRequirements.processor),
                              const SizedBox(height: 4),
                              _requirementRow("Memory", game.minimumSystemRequirements.memory),
                              const SizedBox(height: 4),
                              _requirementRow("Graphics", game.minimumSystemRequirements.graphics),
                              const SizedBox(height: 4),
                              _requirementRow("Storage", game.minimumSystemRequirements.storage),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        if (game.screenshots.isNotEmpty) ...[
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: game.screenshots.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(9),
                                    child: Image.network(
                                      game.screenshots[index].image,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                        ReadMoreText(
                          game.description,
                          trimLines: 3,
                          colorClickableText: Colors.cyanAccent,
                          trimMode: TrimMode.Line,
                          style: TextStyle(color: Colors.grey.shade300, height: 1.5, fontSize: 13),
                          trimCollapsedText: 'more',
                          trimExpandedText: 'less',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}