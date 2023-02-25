import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingCard extends StatelessWidget {
  final String src;
  final _isHovering = false.obs;
  final VoidCallback onTap;

  SettingCard({required this.src, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
          onEnter: (_) => _isHovering.value = true,
          onExit: (_) => _isHovering.value = false,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 1.0, end: 1.3),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutQuart,
            builder: (context, double scale, child) {
              return Obx(() => Transform.scale(
                    scale: _isHovering.value ? scale : 1.0,
                    child: child,
                  ));
            },
            child: InkWell(
              onTap: onTap,
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 40.0,
                      width: 40.0,
                      child: Image.asset(
                        src,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            ),
          )),
    );
  }
}
