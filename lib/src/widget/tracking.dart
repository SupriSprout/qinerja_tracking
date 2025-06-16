import 'package:flutter/material.dart';
import 'package:qinerja_tracking/src/model/need_approval_data.dart';
import 'package:qinerja_tracking/src/model/status_tracking.dart';
import 'package:qinerja_tracking/src/utils/qinerja_loading.dart';
import 'package:qinerja_tracking/src/utils/tracking_color.dart';
import 'package:qinerja_tracking/src/utils/utils.dart';
import 'package:qinerja_tracking/src/widget/dash_painter.dart';
import 'package:qinerja_tracking/src/widget/simple_tracking.dart';

class DetailInboxStatusTracking extends StatelessWidget {
  const DetailInboxStatusTracking(
      {super.key,
      this.isLoading = false,
      this.dataValue,
      required this.statusTracking,
      this.useMarginVertical,
      this.useMarginHorizontal});

  final bool isLoading;
  final NeedApprovalData? dataValue;
  final StatusTrackingModel? statusTracking;
  final double? useMarginHorizontal;
  final double? useMarginVertical;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: QinerjaLoading(),
          )
        : (statusTracking?.data?.histories?.length ?? 0) <= 3
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: useMarginHorizontal ?? 20,
                    vertical: useMarginVertical ?? 10),
                child: StatusTrackingInbox(controller: statusTracking),
                )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: useMarginHorizontal ?? 20,
                    vertical: useMarginVertical ?? 10),
                child: ListView.builder(
                  itemCount: statusTracking?.data?.histories?.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final data = statusTracking?.data?.histories?[index];

                    final pos =
                        (statusTracking?.data?.histories?.length ?? 0) - 1;
                    final bool lastIndex = index != pos;

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(
                                    data!.message!.contains('Waiting') &&
                                            index == 0
                                        ? 4
                                        : 0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: index != 0
                                            ? TrackingColor.lineColor
                                            : data.message!.contains('Waiting') &&
                                                    index == 0
                                                ? BrandConfig.getColor(
                                                    isQinerja: false,
                                                    lbColor: TrackingColor.statePrimaryBlue,
                                                    qinerjaColor:
                                                        TrackingColor.textPrimaryBrandColor)
                                                : Colors.transparent),
                                    color: data.message!.contains('Approved')
                                        ? BrandConfig.getColor(
                                            isQinerja: false,
                                            lbColor: TrackingColor.statePrimaryBlue,
                                            qinerjaColor: TrackingColor.textPrimaryBrandColor)
                                        : index != 0
                                            ? TrackingColor.textPrimaryInvertColor
                                            : pos == 3
                                                ? data.message!.contains(
                                                            'Waiting') &&
                                                        index == 0
                                                    ? Colors.transparent
                                                    : TrackingColor.lineBorder
                                                : pos == 4 &&
                                                        data.message!.contains(
                                                            'Approved')
                                                    ? BrandConfig.getColor(
                                                        isQinerja: false,
                                                        lbColor:
                                                            TrackingColor.statePrimaryBlue,
                                                        qinerjaColor:
                                                            TrackingColor.statePrimaryYellow)
                                                    : TrackingColor.statePrimaryRed,
                                    borderRadius: BorderRadius.circular(100)),
                                child: data.message!.contains('Approved')
                                    ? const Icon(
                                        Icons.check,
                                        size: 18,
                                        color: Colors.white,
                                      )
                                    : pos == 3
                                        ? data.message!.contains('Waiting') &&
                                                index == 0
                                            ? Container(
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: BrandConfig.getColor(
                                                      isQinerja: false,
                                                      lbColor: TrackingColor.statePrimaryBlue,
                                                      qinerjaColor:
                                                          TrackingColor.borderPrimaryBrandColor),
                                                ),
                                              )
                                            : const Icon(
                                                Icons.check,
                                                size: 18,
                                                color: TrackingColor.white,
                                              )
                                        : pos == 4 &&
                                                data.message!.contains('Approved')
                                            ? const Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 13,
                                                  color: TrackingColor.white,
                                                ),
                                              )
                                            : const Icon(
                                                Icons.close,
                                                size: 18,
                                                color: TrackingColor.textPrimaryInvertColor,
                                              )),
                            // TODO: hardcode dulu pakai 3
                            SizedBox(
                              height: (data.requestStatus == 'Approved')
                                  ? 110
                                  : (data.message?.contains('Waiting') ?? false)
                                      ? 110
                                      : (data.message?.contains('Rejected') ??
                                              false)
                                          ? 110
                                          : index + 1 ==
                                                  statusTracking
                                                      ?.data?.histories?.length
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
                            )
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
                                children: [
                                  Expanded(
                                    child: Text(data.message ?? '',
                                        style: const TextStyle(
                                            color: TrackingColor.textPrimaryHeavyColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Text(
                                        data.createdAt != null
                                            ? BrandConfig
                                                .convertDateMonthYearTime(
                                                DateTime.parse(data.createdAt ??
                                                    '0000-00-00'),
                                              )
                                            : '',
                                        style: const TextStyle(
                                            color: TrackingColor.textPrimaryHeavyColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                              if ((data.message?.contains('Rejected') ??
                                      false) &&
                                  data.reason != '')
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: TrackingColor.lineColor),
                                      color: TrackingColor.surfacePrimarySoftColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Reason: ',
                                        style: TextStyle(
                                            color: TrackingColor.textPrimaryMediumColor),
                                      ),
                                      Text(
                                        data.reason ?? '',
                                        style: const TextStyle(
                                            color: TrackingColor.textPrimaryHeavyColor),
                                      ),
                                    ],
                                  ),
                                ),
                              // if (data.requestStatus == 'Approved')
                              //   QinerjaApprovedAmountInfo(
                              //     approvedAmount: '',
                              //     reason: data.reason ?? '-',
                              //   ),
                              // if ((data.message?.contains('Waiting') ??
                              //         false) &&
                              //     !(data.message?.contains('Rejected') ??
                              //         false))
                              //   QinerjaEmployeeListTileInfo(
                              //     employeeName: data.leadFullName ?? "-",
                              //     avatarUrl: data.leadProfilePicture,
                              //     title: '',
                              //     jobPosition: data.leadJobPositionName,
                              //     avatarSize: 40,
                              //     whatsAppLink: data.leadWhatsapp,
                              //     teamsLink: data.leadTeamLink,
                              //   )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
  }
}
