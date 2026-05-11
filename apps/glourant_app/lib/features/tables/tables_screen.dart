import 'package:flutter/material.dart';

import '../../shared/layouts/app_scroll.dart';
import '../../shared/widgets/section_title.dart';
import 'widgets/table_grid.dart';

class TablesScreen extends StatelessWidget {
  const TablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScroll(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: 'Sala en vivo'),
          SizedBox(height: 10),
          TableGrid(compactCards: false),
        ],
      ),
    );
  }
}
