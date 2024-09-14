import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/material.dart';

// CorbadoAuthComponent listens to a Stream<Widget> and rebuilds itself
// whenever a new widget is emitted.
class CorbadoAuthComponent extends StatefulWidget {
  final CorbadoAuth corbadoAuth;
  final Map<ScreenNames, CorbadoComponent> components;

  CorbadoAuthComponent({required this.corbadoAuth, required this.components});

  @override
  _CorbadoAuthComponentState createState() => _CorbadoAuthComponentState();
}

class _CorbadoAuthComponentState extends State<CorbadoAuthComponent> {
  late Stream<ComponentWithData> _componentStream;

  @override
  void initState() {
    super.initState();
    _componentStream = widget.corbadoAuth.componentWithDataStream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ComponentWithData>(
      stream: _componentStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final d = snapshot.data!;
          return widget.components[d.screenName]!.build(context, d.block);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}