import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';

class CustomCarousel extends StatelessWidget {
  final String? date;
  final CarouselController controller;
  final List<String> imgList;
  final int currentIndex;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;
  const CustomCarousel({
    super.key,
    required this.controller,
    required this.imgList,
    required this.currentIndex,
    this.onPageChanged,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                animateToClosest: false,
                enableInfiniteScroll: false,
                height: 200.0,
                viewportFraction: 1.0,
                onPageChanged: onPageChanged,
              ),
              items: imgList
                  .map(
                    (item) => Container(
                      height: 206,
                      decoration: const BoxDecoration(
                        color: AppColors.backColor,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: item,
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            if (date != null)
              Positioned(
                right: 28,
                bottom: 12,
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('Срок: $date')),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => controller.animateToPage(entry.key),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 65.0,
                  height: 64.0,
                  margin: const EdgeInsets.only(right: 8, top: 8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(entry.value),
                    ),
                    border: Border.all(
                      width: 2,
                      color: currentIndex == entry.key
                          ? AppColors.yellow
                          : Colors.transparent,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
