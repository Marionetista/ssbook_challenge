import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColors.purple,
        backgroundColor: Colors.white,
        selectedLabelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w500),
        unselectedLabelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w500),
        iconSize: 30.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: AppColors.purple,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: AppColors.iconGrey,
            ),
            label: 'Adicionar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: AppColors.iconGrey,
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: AppColors.iconGrey,
            ),
            label: 'Favoritos',
          ),
        ],
      );
}
