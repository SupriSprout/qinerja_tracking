import 'package:flutter/material.dart';
import 'package:qinerja_tracking/src/utils/tracking_color.dart';

class QinerjaApprovedAmountInfo extends StatelessWidget {
  const QinerjaApprovedAmountInfo({
    super.key,
    required this.approvedAmount,
    required this.reason,
    this.amountLabelStyle,
    this.amountTextStyle,
    this.reasonLabelStyle,
    this.reasonTextStyle,
    this.bgColor,
    this.colorBorder,
  });

  final String approvedAmount;
  final String reason;
  final TextStyle? amountLabelStyle;
  final TextStyle? amountTextStyle;
  final TextStyle? reasonLabelStyle;
  final TextStyle? reasonTextStyle;
  final Color? bgColor;
  final Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: bgColor ?? TrackingColor.surfacePrimarySoftColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: colorBorder ?? TrackingColor.lineBorder,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Approved Amount',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: amountLabelStyle ??
                  const TextStyle(color: TrackingColor.textPrimaryLightColor),
            ),
            Text(
              approvedAmount,
              style: amountLabelStyle ??
                  const TextStyle(color: TrackingColor.textPrimaryHeavyColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Reason',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: reasonLabelStyle ??
                  const TextStyle(color: TrackingColor.textPrimaryLightColor),
            ),
            Text(
              reason,
              style: reasonLabelStyle ??
                  const TextStyle(color: TrackingColor.textPrimaryHeavyColor),
            ),
          ],
        ),
      ),
    );
  }
}
