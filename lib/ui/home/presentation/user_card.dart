import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/utils/style_constant.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, this.title, this.url, this.email, this.website})
      : super(key: key);

  final String? title;
  final String? url;
  final String? email;
  final String? website;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: Styles.defaultElevation,
      shadowColor: Colors.black,
      margin: const EdgeInsets.symmetric(
          horizontal: Styles.marginDouble, vertical: Styles.defaultMargin),
      child: Padding(
        padding:
            const EdgeInsets.all(Styles.defaultPadding + Styles.marginMini),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Styles.paddingMini),
              child: Text(
                title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black),
              ),
            ),
            AspectRatio(
              aspectRatio: 3 / 2,
              child: CachedNetworkImage(
                imageUrl: url ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.colorBurn,
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Styles.paddingMini),
              child: Text(email ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black)),
            ),
            Text(website ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
