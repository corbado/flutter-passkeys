import 'package:flutter/material.dart';

/// A widget that renders a single screen of an authentication flow.
abstract class CorbadoScreen<T> implements Widget {
  /// Constructor
  CorbadoScreen(this.block);

  /// The block holding the data and callbacks for this screen.
  final T block;
}
