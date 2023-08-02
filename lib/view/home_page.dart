import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/view/widgets.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Hacker News'),
          bottom: TabBar(
            tabs: const [
              Tab(
                  child: TextButton(
                onPressed: null,
                child: Text(
                  'Top Stories',
                  style: TextStyle(color: Colors.black),
                ),
              )),
              Tab(
                  child: TextButton(
                onPressed: null,
                child: Text(
                  'New Stories',
                  style: TextStyle(color: Colors.black),
                ),
              )),
              Tab(
                  child: TextButton(
                onPressed: null,
                child: Text(
                  'Best Stories',
                  style: TextStyle(color: Colors.black),
                ),
              )),
            ],
            unselectedLabelColor: const Color.fromARGB(255, 147, 141, 141),
            indicatorSize: TabBarIndicatorSize.values[1],
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 217, 217, 217)),
          ),
        ),
        body: const TabBarView(
          children: [
            TabBarWidgets(storyType: 'topstories'),
            TabBarWidgets(storyType: 'newstories'),
            TabBarWidgets(storyType: 'beststories'),
          ],
        ),
      ),
    );
  }
}
