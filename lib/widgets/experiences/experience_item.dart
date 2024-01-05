import 'package:flutter/material.dart';
import 'package:resume_web/models/work_experience.dart';
import 'package:resume_web/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../assets/image_asset.dart';

class ExperienceItem extends StatelessWidget {
  final WorkExperience experience;

  const ExperienceItem({
    Key? key,
    required this.experience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDesktop = Utils.isDesktop(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ImageAsset(
            asset: experience.imageCover,
            width: isDesktop ? 200 : 130,
            height: isDesktop ? 300 : 220,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTopTittleView(context),
            const SizedBox(
              height: 5,
            ),
            buildDivider(context),
            const SizedBox(
              height: 20,
            ),
            Text(
              experience.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: isDesktop ? 15 : 13, height: 2),
            ),
          ],
        ))
      ],
    );
  }

  Row buildTopTittleView(BuildContext context) {
    var isDesktop = Utils.isDesktop(context);
    return Row(
      children: [
        if (experience.logo != null)
          GestureDetector(
            onTap: experience.link == null
                ? null
                : () {
                    launchUrl(Uri.parse(experience.link.toString()));
                  },
            child: ImageAsset(
              asset: experience.logo.toString(),
              width: isDesktop ? 60 : 40,
              height: isDesktop ? 60 : 40,
              fit: BoxFit.cover,
            ),
          ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.title,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: isDesktop ? 20 : 18,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              experience.date,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: isDesktop ? 15 : 13,
                  ),
            ),
          ],
        )
      ],
    );
  }

  Container buildDivider(BuildContext context) {
    var isDesktop = Utils.isDesktop(context);
    return Container(
      width: isDesktop ? 500 : 400,
      height: 2,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
