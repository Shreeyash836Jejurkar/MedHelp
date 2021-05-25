import 'package:flutter/material.dart';

class specialistCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: [
        FilterChip(
          selected: false,
          label: Text("Cardiologists"),
          onSelected: null,
          selectedColor: Colors.blue,
        ),
        FilterChip(
          selected: false,
          label: Text("Pneumologis"),
          onSelected: null,
          selectedColor: Colors.blue,
        ),
        FilterChip(
          selected: true,
          label: Text("Neurologists"),
          onSelected: null,
          selectedColor: Colors.blue[300],
        ),
        FilterChip(
          selected: false,
          label: Text("Dermatologists"),
          onSelected: null,
          selectedColor: Colors.blue,
        ),
        FilterChip(
          selected: false,
          label: Text("Nephrologists"),
          onSelected: null,
          selectedColor: Colors.blue,
        ),
        FilterChip(
          selected: false,
          label: Text("Dermatologists"),
          onSelected: null,
          selectedColor: Colors.blue,
        ),
        FilterChip(
          selected: false,
          label: Text("Dermatologists"),
          onSelected: null,
          selectedColor: Colors.blue,
        ),
      ],
    );
  }
}
