import 'package:flutter/material.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _TestPage(),
    );
  }
}

class _TestPage extends StatefulWidget {
  const _TestPage();

  @override
  State<_TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<_TestPage> with SingleTickerProviderStateMixin {
  final _list = List.generate(30, (index) => index);
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _animation,
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          slivers: _list
              .map(
                (index) => SliverToBoxAdapter(
                  child: Container(
                    color: index.isEven ? Colors.green : Colors.red,
                    height: 100,
                    width: double.infinity,
                    child: Text('$index'),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
