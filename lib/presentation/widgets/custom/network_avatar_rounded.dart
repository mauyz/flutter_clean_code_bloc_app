import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class NetworkAvatarRounded extends StatelessWidget {
  final User user;
  const NetworkAvatarRounded({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final avatar = user.profilepicture;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1.0,
        ),
      ),
      child: avatar == null
          ? const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            )
          : CircleAvatar(
              radius: 40,
              foregroundImage: ExtendedNetworkImageProvider(
                avatar,
                cacheKey: 'avatar_{user.id}',
                imageCacheName: 'avatar_{user.id}',
                printError: true,
                cache: true,
              ),
            ),
    );
  }
}
