import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class QinerjaLoading extends StatelessWidget {
  const QinerjaLoading({super.key, this.size = 30});

  final double size;

  @override
  Widget build(BuildContext context) {
    const borderPrimaryBrandColor = Color(0xFFFFD300);
    /// 1==1 is for labamu
    return 1==1
        ? const SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              color: borderPrimaryBrandColor,
              strokeWidth: 2.5,
            ),
          )
        : SizedBox(
            height: size,
            width: size,
            child: const RiveAnimation.asset('assets/loading_state.riv'));
  }
}