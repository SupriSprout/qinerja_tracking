import 'package:flutter/material.dart';
import 'package:qinerja_tracking/src/model/status_tracking.dart';
import 'package:qinerja_tracking/src/utils/qinerja_employee_list_tile_info.dart';
import 'package:qinerja_tracking/src/utils/tracking_color.dart';
import 'package:qinerja_tracking/src/utils/utils.dart';
import 'package:qinerja_tracking/src/widget/dash_painter.dart';

class StatusTrackingInbox extends StatelessWidget {
  const StatusTrackingInbox({super.key, required this.controller});

  final StatusTrackingModel? controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller?.data?.histories?.length ?? 0,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final data = controller?.data?.histories?[index];
        final pos = (controller?.data?.histories?.length ?? 1) - 1;
        final bool lastIndex = index != pos;
        final message = data?.message ?? '';

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                    padding:
                        EdgeInsets.all(message.contains('Waiting') ? 4 : 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: index != 0
                                ? TrackingColor.lineColor
                                : message.contains('Waiting')
                                    ? BrandConfig.getColor(
                                        isQinerja: false,
                                        lbColor: TrackingColor.statePrimaryBlue,
                                        qinerjaColor: TrackingColor
                                            .borderPrimaryBrandColor)
                                    : Colors.transparent),
                        color: index != 0
                            ? TrackingColor.textPrimaryInvertColor
                            : pos == 1 && !message.contains('Waiting')
                                ? TrackingColor.lineBorder
                                : message.contains('Approved')
                                    ? BrandConfig.getColor(
                                        isQinerja: false,
                                        lbColor: TrackingColor.statePrimaryBlue,
                                        qinerjaColor: TrackingColor
                                            .borderPrimaryBrandColor)
                                    : message.contains('Waiting')
                                        ? Colors.transparent
                                        : TrackingColor.statePrimaryRed,
                        borderRadius: BorderRadius.circular(100)),
                    child: pos == 1 && !message.contains('Waiting')
                        ? const Icon(
                            Icons.check,
                            size: 18,
                            color: TrackingColor.white,
                          )
                        : message.contains('Approved')
                            ? const Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.check,
                                  size: 13,
                                  color: TrackingColor.white,
                                ),
                              )
                            : message.contains('Waiting')
                                ? Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: BrandConfig.getColor(
                                          isQinerja: false,
                                          lbColor:
                                              TrackingColor.statePrimaryBlue,
                                          qinerjaColor: TrackingColor
                                              .borderPrimaryBrandColor),
                                    ),
                                  )
                                : const Icon(
                                    Icons.close,
                                    size: 18,
                                    color: TrackingColor.textPrimaryInvertColor,
                                  )),
                SizedBox(
                  height: data?.leadFullName?.isNotEmpty ?? false
                      ? 90
                      : index + 1 == controller?.data?.histories?.length
                          ? 6
                          : 48,
                  width: 1,
                  child: CustomPaint(
                    painter: DashedLinePainter(
                      color: lastIndex
                          ? TrackingColor.lineColor
                          : Colors.transparent,
                      dashWidth: 2.0,
                      dashSpace: 4.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(data?.message ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: TrackingColor.textPrimaryHeavyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                            data?.createdAt != null
                                ? BrandConfig.convertDateMonthYearTime(
                                    DateTime.parse(
                                        data?.createdAt ?? '0000-00-00'),
                                  )
                                : '',
                            style: const TextStyle(
                                color: TrackingColor.textPrimaryHeavyColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  if ((data?.message?.contains('Rejected') ?? false) &&
                      (data?.reason?.isNotEmpty ?? false))
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: TrackingColor.lineColor),
                          color: TrackingColor.surfacePrimarySoftColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Reason: ',
                            style: TextStyle(
                                color: TrackingColor.textPrimaryMediumColor),
                          ),
                          Text(
                            data?.reason ?? '',
                            style: const TextStyle(
                                    color: TrackingColor.textPrimaryHeavyColor),
                          ),
                        ],
                      ),
                    ),
                  if ((data?.message?.contains('Rejected') ?? false) ||
                      (data?.message?.contains('Waiting') ?? false))
                    QinerjaEmployeeListTileInfo(
                      employeeName: data?.leadFullName ?? "-",
                      avatarUrl: data?.leadProfilePicture,
                      title: '',
                      jobPosition: data?.leadJobPositionName,
                      avatarSize: 40,
                      whatsAppLink: data?.leadWhatsapp,
                      teamsLink: data?.leadTeamLink,
                    )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
