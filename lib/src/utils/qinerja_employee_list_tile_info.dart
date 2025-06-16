import 'package:flutter/material.dart';
import 'package:qinerja_tracking/src/utils/qinerja_image_helper.dart';
import 'package:qinerja_tracking/src/utils/tracking_color.dart';
import 'package:qinerja_tracking/src/utils/utils.dart';

class QinerjaEmployeeListTileInfo extends StatelessWidget {
  const QinerjaEmployeeListTileInfo(
      {super.key,
      this.title,
      required this.employeeName,
      this.jobPosition,
      this.avatarUrl,
      this.avatarSize = 60,
      this.teamsLink,
      this.whatsAppLink,
      this.customSuffix,
      this.titleStyle,
      this.employeeNameStyle,
      this.jobPositionStyle,
      this.colorBorder,
      this.bgColor});

  final String? title;
  final String employeeName;
  final String? jobPosition;
  final String? avatarUrl;
  final double avatarSize;
  final String? teamsLink;
  final String? whatsAppLink;
  final TextStyle? titleStyle;
  final TextStyle? employeeNameStyle;
  final TextStyle? jobPositionStyle;
  final Widget? customSuffix;
  final Color? colorBorder;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    const String flavor = String.fromEnvironment('FLAVOR_NAME', defaultValue: 'dev');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title!,
              style: titleStyle ??
                  const TextStyle(color: TrackingColor.textPrimaryMediumColor),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: bgColor ?? TrackingColor.surfacePrimarySoftColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: colorBorder ?? TrackingColor.lineBorder,
            ),
          ),
          child: Row(
            children: [
              QinerjaImageHelper(
                borderRadius: 100,
                url: avatarUrl ?? '',
                generateName: employeeName,
                height: avatarSize,
                width: avatarSize,
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employeeName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: employeeNameStyle ??
                          const TextStyle(color: TrackingColor.textPrimaryHeavyColor),
                    ),
                    Text(
                      jobPosition ?? '',
                      style: jobPositionStyle ??
                          const TextStyle(color: TrackingColor.textPrimaryLightColor),
                    ),
                  ],
                ),
              ),
              if (flavor != 'labamu') ...[
                const SizedBox(
                  width: 12,
                ),
                customSuffix ??
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              final link = teamsLink?.replaceAll('MSTeams:', 'https://teams.microsoft.com');
                              BrandConfig.launchURL(link ?? 'https://teams.microsoft.com');
                            },
                            child: Image.asset(
                              'assets/images/login-teams.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                          Container(
                            height: 24,
                            width: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            color: TrackingColor.lineBorder,
                          ),
                          InkWell(
                            onTap: () {
                              if (whatsAppLink == "https://wa.me/-") return;
                              final phone = whatsAppLink;
                              if (phone != null) {
                                final link = phone.contains('https')
                                    ? phone
                                    : "https://wa.me/${phone.replaceFirst(RegExp(r'^0'), '62')}";
                                BrandConfig.launchURL(link);
                              }
                            },
                            child: Image.asset(
                              whatsAppLink == "https://wa.me/-"
                                  ? 'assets/images/logo-wa-disabled.png'
                                  : 'assets/images/logo-wa.png',
                              height: 24,
                              width: 24,
                            ),
                          )
                        ],
                      ),
                    )
              ] else ...[
                InkWell(
                  onTap: () {
                    if (whatsAppLink == "https://wa.me/-") return;
                    final phone = whatsAppLink;
                    if (phone != null) {
                      final link =
                          phone.contains('https') ? phone : "https://wa.me/${phone.replaceFirst(RegExp(r'^0'), '62')}";
                      BrandConfig.launchURL(link);
                    }
                  },
                  child: Image.asset(
                    whatsAppLink == "https://wa.me/-"
                        ? 'assets/images/logo-wa-disabled.png'
                        : 'assets/images/logo-wa.png',
                    height: 24,
                    width: 24,
                  ),
                )
              ]
            ],
          ),
        )
      ],
    );
  }
}
