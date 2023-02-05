import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stall_manager/utils/widgets/stream_list_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'models/stall.dart';
import 'utils/debounce.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late final ValueNotifier<String> _searchNotifier;
  late final Debounce _searchDebounce;
  final _stallsQuery = FirebaseFirestore.instance.collection('stalls').where()

  // final _stallsStream = Firestore.instance
  //     .collection('stalls')
  //     .stream
  //     .map((docs) => docs.map((doc) => Stall.fromMap(doc.map)).toList());

  @override
  void initState() {
    super.initState();
    _searchDebounce = const Debounce(Duration(milliseconds: 500));
    _searchNotifier = ValueNotifier('');
  }

  @override
  void dispose() {
    _searchNotifier.dispose();
    _searchDebounce.cancel();
    super.dispose();
  }

  void _search(String query) {
    _searchNotifier.value = query;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (text) {
              final query = text.trim().toLowerCase();
              _searchDebounce.run(() => _search(query));
            },
            decoration: const InputDecoration(
              hintText: 'What are you looking for?',
            ),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: _searchNotifier,
            builder: (context, query, _) {

              return FirestoreListView(query: _stallsQuery, itemBuilder: itemBuilder)

              // return StreamListView(
              //   stream: _stallsStream,
              //   itemBuilder: (context, index, stall) {
              //     return StallItem(stall: stall);
              //   },
              //   errorBuilder: (context, error) {
              //     return const Center(child: Text('Failed to load stalls'));
              //   },
              //   loadingBuilder: (context) {
              //     return const Center(child: CircularProgressIndicator());
              //   },
              //   emptyBuilder: (context) {
              //     return const Center(child: Text('No stalls found'));
              //   },
              // );
            },
          ),
        ),
      ],
    );
  }
}

class StallItem extends StatelessWidget {
  const StallItem({super.key, required this.stall});

  final Stall stall;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(stall.name),
        subtitle: Text(stall.ownerId),
      ),
    );
  }
}
