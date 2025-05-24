import 'package:flutter/material.dart';
import '../commons.dart';

class SliversPage extends StatefulWidget {
  const SliversPage({super.key});

  @override
  State<SliversPage> createState() => _SliversPageState();
}

class _SliversPageState extends State<SliversPage> {
  List<SliverList> innerLists = [];
  final numLists = 15;
  final numberOfItemsPerList = 100;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < numLists; i++) {
      final innerList = <ColorRow>[];
      for (int j = 0; j < numberOfItemsPerList; j++) {
        innerList.add(const ColorRow());
      }
      innerLists.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => innerList[index],
            childCount: numberOfItemsPerList,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scenario #2")),
      body: CustomScrollView(slivers: innerLists),
    );
  }
}
