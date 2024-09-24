import 'package:flutter/material.dart';

abstract class CorbadoScreen<T> implements Widget {
  final T block;

  CorbadoScreen(this.block);
}
