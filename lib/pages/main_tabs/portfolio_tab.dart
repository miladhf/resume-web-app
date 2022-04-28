import 'package:flutter/material.dart';

class PortfolioTab extends StatefulWidget {
  const PortfolioTab({Key? key}) : super(key: key);

  @override
  _PortfolioTabState createState() => _PortfolioTabState();
}

class _PortfolioTabState extends State<PortfolioTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Portfolio'));
  }
}
