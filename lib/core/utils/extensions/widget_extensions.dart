import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  // Wrap with Padding
  Widget paddingAll(double val) => Padding(
        padding: EdgeInsets.all(val),
        child: this,
      );

  // Wrap with Visibility
  Widget visible(bool isVisible) => isVisible ? this : const SizedBox.shrink();
  
  // Wrap with Center
  Widget get center => Center(child: this);
}

//Usages
// // OLD
// Container(
//   margin: const EdgeInsets.all(16),
//   child: Text('Hello'),
// )

// // NEW (Clean!)
// Text('Hello').paddingAll(16);