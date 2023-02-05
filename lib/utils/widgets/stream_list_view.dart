import 'package:flutter/material.dart';

class StreamListView<T> extends StatefulWidget {
  const StreamListView({
    super.key,
    required this.stream,
    required this.itemBuilder,
    required this.errorBuilder,
    required this.loadingBuilder,
    required this.emptyBuilder,
    this.shrinkWrap = false,
  });

  final Stream<List<T>> stream;
  final Widget Function(BuildContext, int, T) itemBuilder;
  final Widget Function(BuildContext, Object) errorBuilder;
  final Widget Function(BuildContext) loadingBuilder;
  final Widget Function(BuildContext) emptyBuilder;
  final bool shrinkWrap;

  @override
  State<StreamListView> createState() => _StreamListViewState<T>();
}

class _StreamListViewState<T> extends State<StreamListView<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<T>>(
      stream: widget.stream,
      builder: (context, snap) {
        if (snap.hasError) {
          return widget.errorBuilder(context, snap.error!);
        }
        if (snap.hasData) {
          final data = snap.data;
          if (data == null || data.isEmpty) {
            return widget.emptyBuilder(context);
          }
          return ListView.builder(
            shrinkWrap: widget.shrinkWrap,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return widget.itemBuilder(context, index, data[index]);
            },
          );
        }
        return widget.loadingBuilder(context);
      }
    );
  }
}
