import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text('Hello! Cristian'),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_rounded, size: 35),
        ),
        SizedBox(width: 15),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://beam-images.warnermediacdn.com/BEAM_LWM_DELIVERABLES/6ce5965d-cdb2-4f9c-b22b-ae7a091d95a8/dc238ae9-ef39-4cdd-b4b7-a63fa6995f86?host=wbd-images.prod-vod.h264.io&partner=beamcom',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
