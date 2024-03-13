import 'package:flutter/material.dart';
import 'package:residential_manager/src/common/widgets/cercular_container.dart';
import 'package:residential_manager/src/common/widgets/curvededge.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';

class TprimaryHeaderContainer extends StatelessWidget {
  const TprimaryHeaderContainer({
    super.key,
    required this.child,
    
  }) ;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: Tcolors.primary,
        padding: const EdgeInsets.only(bottom: 0),
        child:  SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(backgroundColor: Tcolors.white.withOpacity(0.1)),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(backgroundColor: Tcolors.white.withOpacity(0.1)),
              ),
              child
            ],
          ),
        ), 
      ), 
    ); 
  }
}
