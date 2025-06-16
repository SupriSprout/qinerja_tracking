import 'package:flutter/material.dart';
import 'package:qinerja_tracking/src/model/need_approval_data.dart';
import 'package:qinerja_tracking/src/model/status_tracking.dart';
import 'package:qinerja_tracking/src/utils/utils.dart';
import 'package:qinerja_tracking/src/widget/dash_painter.dart';

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
    const lineColor = Color(0xFFE4E3DD);
    const white = Color(0xFFFFFFFF);
    const statePrimaryRed = Color(0xFFE3393A);
    const statePrimaryYellow = Color(0xFFAFD932);
    const statePrimaryBlue = Color(0xFF1866CA);
    const textPrimaryHeavyColor = Color(0xFF282828);
    const textPrimaryBrandColor = Color(0xFFFFD300);
    const textPrimaryInvertColor = Color(0xFFFFFFFF);
    const lineBorder = Color(0xFFE4E3DD);
    const borderPrimaryBrandColor = Color(0xFFFFD300);
    const surfacePrimarySoftColor = Color(0xFFF8F8F8);
    const textPrimaryMediumColor = Color(0xFF6F6F6F);
    return isLoading
        ? Center(
            child: Container(),
          )
        : (statusTracking?.data?.histories?.length ?? 0) <= 3
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: useMarginHorizontal ?? 20,
                    vertical: useMarginVertical ?? 10),
                child:
                    Container() //StatusTrackingInbox(controller: statusTracking),
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
                                            ? lineColor
                                            : data.message!.contains('Waiting') &&
                                                    index == 0
                                                ? BrandConfig.getColor(
                                                    isQinerja: false,
                                                    lbColor: statePrimaryBlue,
                                                    qinerjaColor:
                                                        textPrimaryBrandColor)
                                                : Colors.transparent),
                                    color: data.message!.contains('Approved')
                                        ? BrandConfig.getColor(
                                            isQinerja: false,
                                            lbColor: statePrimaryBlue,
                                            qinerjaColor: textPrimaryBrandColor)
                                        : index != 0
                                            ? textPrimaryInvertColor
                                            : pos == 3
                                                ? data.message!.contains(
                                                            'Waiting') &&
                                                        index == 0
                                                    ? Colors.transparent
                                                    : lineBorder
                                                : pos == 4 &&
                                                        data.message!.contains(
                                                            'Approved')
                                                    ? BrandConfig.getColor(
                                                        isQinerja: false,
                                                        lbColor:
                                                            statePrimaryBlue,
                                                        qinerjaColor:
                                                            statePrimaryYellow)
                                                    : statePrimaryRed,
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
                                                      lbColor: statePrimaryBlue,
                                                      qinerjaColor:
                                                          borderPrimaryBrandColor),
                                                ),
                                              )
                                            : const Icon(
                                                Icons.check,
                                                size: 18,
                                                color: white,
                                              )
                                        : pos == 4 &&
                                                data.message!.contains('Approved')
                                            ? const Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 13,
                                                  color: white,
                                                ),
                                              )
                                            : const Icon(
                                                Icons.close,
                                                size: 18,
                                                color: textPrimaryInvertColor,
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
                                      ? lineColor
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
                                            color: textPrimaryHeavyColor,
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
                                            color: textPrimaryHeavyColor,
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
                                      border: Border.all(color: lineColor),
                                      color: surfacePrimarySoftColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Reason: ',
                                        style: TextStyle(
                                            color: textPrimaryMediumColor),
                                      ),
                                      Text(
                                        data.reason ?? '',
                                        style: const TextStyle(
                                            color: textPrimaryHeavyColor),
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
