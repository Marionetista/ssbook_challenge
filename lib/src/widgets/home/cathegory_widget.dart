import 'package:flutter/material.dart';

import 'chip_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              ChipWidget(
                label: 'Todos',
                isSelected: true,
              ),
              ChipWidget(
                label: 'Romance',
                isSelected: false,
              ),
              ChipWidget(
                label: 'Aventura',
                isSelected: false,
              ),
              ChipWidget(
                label: 'Comédia',
                isSelected: false,
              ),
              ChipWidget(
                label: 'Terror',
                isSelected: false,
              ),
              ChipWidget(
                label: 'Teologia',
                isSelected: false,
              ),
            ],
          ),
        ),
      );
}
