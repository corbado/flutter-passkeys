import 'package:flutter/material.dart';

abstract class CorbadoScreen<T> implements Widget {
  CorbadoScreen(this.block);
  final T block;
}
