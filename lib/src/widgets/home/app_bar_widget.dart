import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    required this.userIcon,
    super.key,
  });

  final String userIcon;

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'SS',
                  style: GoogleFonts.bebasNeue(
                    color: AppColors.darkGrey,
                    fontSize: 33.0,
                  ),
                ),
                TextSpan(
                  text: 'BOOK',
                  style: GoogleFonts.bebasNeue(
                    color: AppColors.purple,
                    fontSize: 33.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://picsum.photos/250?image=9'),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 31.0,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        'Meus livros',
                        style: GoogleFonts.roboto(
                          color: AppColors.darkGrey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        height: 4.0,
                        width: 94,
                        decoration: const BoxDecoration(
                          color: AppColors.purple,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Text(
                      'Emprestados',
                      style: GoogleFonts.roboto(
                        color: AppColors.darkGrey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(height: 4.0),
                  ],
                ),
              ),
              const SizedBox(),
              Container(
                height: 4.0,
                width: 94,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ],
          ),
        ),
      );

  @override
  Size get preferredSize => const Size(double.maxFinite, 110);
}
