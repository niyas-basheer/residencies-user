import 'package:flutter/material.dart';
import 'package:residential_manager/src/common/widgets/cercular_container.dart';
import 'package:residential_manager/src/common/widgets/curvededge.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: Tcolors.primary,
        child: Stack(
          children: [
            // Background Custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                backgroundColor: Colors.white.withOpacity(0.03),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                backgroundColor: Colors.white.withOpacity(0.3),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
