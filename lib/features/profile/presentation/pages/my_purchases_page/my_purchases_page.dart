import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/core/constants/app_svg.dart';

class MyPurchasesPage extends StatefulWidget {
  const MyPurchasesPage({super.key});

  @override
  State<MyPurchasesPage> createState() => _MyPurchasesPageState();
}

class _MyPurchasesPageState extends State<MyPurchasesPage> {
  void onPurchaseTap() {
    Navigator.pushNamed(context, AppRouteNames.detailPurchasePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои покупки'),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        itemCount: 20,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: onPurchaseTap,
            child: Ink(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    width: 86,
                    height: 112,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            'https://s3-alpha-sig.figma.com/img/19ce/00d8/b2d127941e48588800f465f82a6d8f60?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=U0pRw4h9GA4Y1U7K2229emVLtKoC7U-wDIOotGE9DnZnGhPrqKFwtu64HdlBWRCJ4XUlNiMtLiBAUw4w-eaL2sZg4aIvpgAWayupOS~0Rjk8lRqFJVErSBfMnSkiuUI28X-Ni1KobX-sTX5uTFRCw9fQlJyb~CPL3LkzUp~hHFGmKq434d~5Ryt6JJlmMR-V8TRIjt7cj5IuixHjvlFR-06BEkIGpj58Szw3WRUREfUM5HeMzf3r6JxuKS-nfzgEZ2xEvnc-tPJLbI6WtVaslTYS0V67ugKwcplD~7t5gC9M23lNpXMiORG0Z-7RIZnOX0BR3sKyKsCCZegybCSq5A__'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Заказ №5',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 8,
                              ),
                              child: Text(
                                '1000 сом',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: CachedNetworkImageProvider(
                                  'https://s3-alpha-sig.figma.com/img/ffc1/4cd3/1111aefb2980dcf0a98c1acf18ebd9d2?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=T6ZDU69~ZT0fXFurVZGA-YeJA5IJ2B1ai1EUE-Abmid7-p7NN53fg0Ijq8-sJ9qeltKBNa3kPdocMV4QsC4LXXVmpvnxAuN-~Y-xbM6LClDQZEXro8PBIDmhXA~yXEIJx8LlzCmA6tKkHkDevD4U4GsG05-giFbc9ZoDQuPaKoM0HpleJzgwBxgDGgdxhy782gXCwR~Uq5mYVIdNbnVSreJQ78lORYAbYsxIyz5P8gspKmPnsMG2ZvZiSd1ulMf5WeTM6zMVY2hYwFaRRbz7xpWSdnBAIc6zA8mKjsnF62nM7u22WoKuqJA6dcVDzT4qYfow70ty6eV9jzj3EVdRnA__'),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sandy Wilder Cheng',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Автор объявления',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing eliе fsff  fdsfs  f',
                            style: TextStyle(
                              color: AppColors.darkGrey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.yellow,
        onPressed: () {},
        shape: const CircleBorder(),
        child: SvgPicture.asset(AppSvg.search),
      ),
    );
  }
}
