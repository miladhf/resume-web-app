import 'package:flutter/material.dart';

class SkillsTab extends StatefulWidget {
  const SkillsTab({Key? key}) : super(key: key);

  @override
  _SkillsTabState createState() => _SkillsTabState();
}

class _SkillsTabState extends State<SkillsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Skills'));
  }
}
