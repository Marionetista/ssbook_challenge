import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';
import '../../widgets/home/app_bar_widget.dart';
import '../../widgets/home/author_card_widget.dart';
import '../../widgets/home/book_card_widget.dart';
import '../../widgets/home/bottom_app_bar_widget.dart';
import '../../widgets/home/chip_widget.dart';
import '../../widgets/home/favorite_book_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.purpleGrey,
        appBar: const AppBarWidget(
          userIcon: 'https://picsum.photos/250?image=9',
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 32.0,
                    bottom: 21.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Livros favoritos',
                        style: GoogleFonts.roboto(
                          color: AppColors.darkGrey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'ver todos',
                          style: GoogleFonts.roboto(
                            color: AppColors.purple,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 32.0),
                  child: SizedBox(
                    height: 270,
                    child: ListView.separated(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const FavoriteBookCardWidget(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(42.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 32.0,
                          bottom: 21.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Autores favoritos',
                              style: GoogleFonts.roboto(
                                color: AppColors.darkGrey,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'ver todos',
                                style: GoogleFonts.roboto(
                                  color: AppColors.purple,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SizedBox(
                          height: 69.0,
                          child: ListView.separated(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                const AuthorCardWidget(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 31.0,
                          bottom: 21.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Biblioteca',
                              style: GoogleFonts.roboto(
                                color: AppColors.darkGrey,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 20.0,
                        ),
                        child: LayoutBuilder(
                          builder: (
                            BuildContext context,
                            BoxConstraints constraints,
                          ) =>
                              ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 6,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemBuilder: (context, index) =>
                                const BookCardWidget(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomAppBarWidget(),
      );
}
