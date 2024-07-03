import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_tailor/core/common_widgets/adaptive_diolog.dart';
import 'package:smart_tailor/core/common_widgets/contact_widget.dart';
import 'package:smart_tailor/core/common_widgets/custom_button.dart';
import 'package:smart_tailor/core/common_widgets/custom_carousel.dart';
import 'package:smart_tailor/core/common_widgets/custom_expansion_tile.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/features/profile/presentation/pages/my_announcements_page/widgets/info_title.dart';

class DetailAnnouncPage extends StatefulWidget {
  final String? title;
  const DetailAnnouncPage({
    super.key,
    this.title,
  });

  @override
  State<DetailAnnouncPage> createState() => _DetailAnnouncPageState();
}

class _DetailAnnouncPageState extends State<DetailAnnouncPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  List<String> imgList = [
    'https://s3-alpha-sig.figma.com/img/3de8/e17f/87cf056f022b1efb54d852603b31b8c8?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=eUG9J0Z0a7pw57xckVVgtGShviVyigIEQCaOuVzVj~JgESDw7dACopIlzMm5IjFxf7OAMLdKdxHJwd0-Pcn2yJVrw5hpCLZpk7E1wR~GK-GYhn-P2bTVv4SQJvPYaypmDXgNqNf-4LBJjkdux-JHq~8L2-Qw8A8nVFTSyfSPYyI9vtEJD3tN93elppCiqiBIFGB8sSRLI9DL0Zw2xTSP59G3FQQfEAbnbedclLZ7opLHFORhPJEXukkWr9sWjNF5blYw3z0qTboUhMWuFnxRdvJxkdL8lk3jSsYezjxrfg7DA1Al~Dz15JNAWnJz5Ej04WGi6YYpLBkqmECH6hUSWQ__',
    'https://s3-alpha-sig.figma.com/img/5a18/7a0c/cd74580e1c13ad712d5fe40cb47d73c4?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lPCOJSuzLRPTW0ekZhXj4URc1UDan~VPmljdzlOzIm7u-CzNCE44dtYAgxMUKYNk7OTh4gTWS1os7X6XlWsxTg-oEC7V4xI5jidUW2xAJSr33aIBcugMsE~sAw1lxJe4z9~jZm2~sSD5TohBVnQdg3wDQoaog0meR2VZZ3x7NmmiYcpwSZ1asH2Y8IC~yM-IzgbCkJlHD8RzZZ~-34akcgf~FQxNOzrvLodmsjxK468y9XKv0Tm3msNCuVHwbqaADLocxOxiFJcUe63zV0LNt1K4vXhlNgP4hkf9~KmOmjpa5MHeEl6wsEOD7EjuI7j2mw0ounCJHhLlPDkfD02cbQ__',
    'https://s3-alpha-sig.figma.com/img/0d4f/9b87/e5c82f93ffd9016e7860ff59aaad88ae?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kiOzPTe1F0ZSaMaBMwN8N7PKUGU~JK0hYR5wKNy4q2-~at-ZquGWiFMO~w1tVvIREj5Qy1KeNKGLbYhSyn81-ODqwC-lkJS7bkXchKyOWGgcC~5Jmjibq4Xm4T0InbCiKc79wSIRLEPHbH6wjphGcEMjM6IBtQzccHE8UY4Zdjj9ujsF3FeE2ixw7SgiRq5is9iMYutjy6x7NxogCoKmMI9rAfaJ34oKgllwmnutjeYvg~7X0xk4A7pz-tbcddxcrkXO-CHEd6vg8FptQQi~K7nAo2czMw~FFmVtuw5z~xL9AQww6qra9pHXCwgKevsIYEuGF-hS07CsTKAEVDO3KQ__',
    'https://s3-alpha-sig.figma.com/img/a357/48bb/89c5b0c7b087305405f6cb20d7f5737c?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MFs7nvFloLVk6dVDuFi1A96WfZRaccwZ17gMbjZi7FutE59B01xZZ2P323rrHBhpcbAmQJBSFwgf1soMQZTVSZNq3ec~IM0YheLAaiOTw~L0UYtuPo3x~BmfC0QVbA2gL40rSkk5niMu4nh~WzixYuU4sVDb71ZScuUYCs24TZOY4s9tqEOTaNoAsWgC2gSI5gqelvxBkUsK9GStPbBY0-f1AEpT9kKOGay-7ofrXqfSjypfrrCrB6-XZ35DA5BhGoaLfppoOOkHppVOJ3qAHD0Rqn1g17w3TW~8MzbUVwWA0UIziV6Gncth~znVlW53xA4NLGX0TntVeRlGHhKCwg__',
  ];
  final CarouselController _controller = CarouselController();
  void onImageChanged(index, reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  bool _isExpanded = false;
  bool _isExpanded1 = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final GlobalKey expansionTileKey = GlobalKey();
  final GlobalKey expansionTileKey1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали объявления'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCarousel(
              controller: _controller,
              imgList: imgList,
              currentIndex: _currentIndex,
              onPageChanged: onImageChanged,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title ?? 'Оборудование',
                    style: TextStyle(
                      color: widget.title == null
                          ? AppColors.green
                          : AppColors.blue,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Швейная машинка',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: TextStyle(
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromRGBO(60, 60, 67, 0.36),
            ),
            const ContactWidget(),
            CustomExpansionTile(
              key: expansionTileKey,
              title: 'Список покупателей',
              isExpanded: _isExpanded,
              onExpansionChanged: onListCustomerTap,
              children: List.generate(
                3,
                (index) => InfoTitle(
                  title: widget.title,
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomExpansionTile(
              key: expansionTileKey1,
              title: 'Отклики',
              isExpanded: _isExpanded1,
              onExpansionChanged: onOtliksTap,
              children: List.generate(
                3,
                (index) => InfoTitle(
                  title: widget.title,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 50),
              child: Column(
                children: [
                  CustomButton(
                    borderRadius: 10,
                    color: Colors.white,
                    foregraundColor: Colors.black,
                    borderColor: AppColors.darkGrey,
                    textStyle: const TextStyle(fontSize: 16),
                    onPressed: () {},
                    child: const Text('Скрыть объявление'),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    borderRadius: 10,
                    borderColor: AppColors.red,
                    textStyle: const TextStyle(fontSize: 16),
                    color: AppColors.red,
                    foregraundColor: Colors.white,
                    onPressed: onDeleteAnnounc,
                    child: const Text('Удалить'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDeleteAnnounc() {
    showDialog(
      context: context,
      builder: (context) {
        return AdaptiveAlertDiolog(
          title: ' Удалить объявление?',
          button1: 'Закрыть',
          button2: 'Да',
          onPressed1: () {
            Navigator.pop(context);
          },
          onPressed2: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void onListCustomerTap(bool expanded) {
    setState(() {
      _isExpanded = expanded;
    });
    if (expanded) {
      _scrollToSelectedContent(expansionTileKey);
    }
  }

  void onOtliksTap(bool expanded) {
    setState(() {
      _isExpanded1 = expanded;
    });
    if (expanded) {
      _scrollToSelectedContent(expansionTileKey1);
    }
  }

  void _scrollToSelectedContent(GlobalKey expansionTileKey) {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      Future.delayed(const Duration(milliseconds: 200)).then((value) {
        Scrollable.ensureVisible(keyContext,
            duration: const Duration(milliseconds: 200));
      });
    }
  }
}
