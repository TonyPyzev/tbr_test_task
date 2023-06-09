import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../domain/entities/launch.dart';

class LaunchListTile extends StatelessWidget {
  final VoidCallback onTap;
  final Launch launch;

  const LaunchListTile({
    super.key,
    required this.onTap,
    required this.launch,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          left: AppPaddings.medium,
          right: AppPaddings.medium,
          bottom: AppPaddings.small,
        ),
        padding: const EdgeInsets.all(
          AppPaddings.medium,
        ),
        decoration: BoxDecoration(
          color: AppColors.fill,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy').format(launch.launchDate),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: AppPaddings.tiny / 2),
                  Text(
                    DateFormat().add_jm().format(launch.launchDate),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    launch.missionName,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  const SizedBox(height: AppPaddings.tiny / 2),
                  Text(
                    launch.siteNameLong,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
