import 'package:flutter/material.dart';
import 'knowledge.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Knowledge',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
        ),
        KnowledgeText(knowledge: 'Flutter, Dart'),
        KnowledgeText(knowledge: 'Firebase, AWS'),
        KnowledgeText(knowledge: 'GetX, Provider, Riverpod'),
        KnowledgeText(knowledge: 'REST APIs, JSON, Postman'),
        KnowledgeText(knowledge: 'Responsive & Adaptive UI'),
        KnowledgeText(knowledge: 'Git, GitHub, CI/CD'),
        KnowledgeText(knowledge: 'UI/UX Design, Figma'),
        KnowledgeText(knowledge: 'Debugging & Optimization'),
        KnowledgeText(knowledge: 'Agile Workflow & Collaboration'),
      ],
    );
  }
}
