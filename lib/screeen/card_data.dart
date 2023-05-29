import 'package:flutter/material.dart';

class CardData {
  final String title;
  final String description;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color descriptionColor;
  final Widget? background;
  const CardData({
    required this.title,
    required this.description,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.descriptionColor,
    this.background,
  });
}

class CardDatas extends StatelessWidget {
  const CardDatas({
    super.key,
    required this.data,
  });

  final CardData data;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (data.background != null) data.background!,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 40),
          child: Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              Flexible(
                  flex: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image(
                      image: data.image,
                      width: 500,
                    ),
                  )),
              const Spacer(
                flex: 1,
              ),
              Text(
                data.title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: data.titleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
                maxLines: 2,
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                data.description,
                style: TextStyle(color: data.descriptionColor, fontSize: 16),
                textAlign: TextAlign.center,
                maxLines: 4,
              ),
              const Spacer(
                flex: 3,
              )
            ],
          ),
        ),
      ],
    );
  }
}
