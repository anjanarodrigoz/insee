import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderDialog extends StatefulWidget {
  final String title;
  final double maxValue;
  final double minValue;
  final double interval;
  final double value;

  const SliderDialog(
      {required this.maxValue,
      required this.minValue,
      required this.interval,
      required this.value,
      required this.title});

  @override
  State<SliderDialog> createState() => _SliderDialogState();
}

class _SliderDialogState extends State<SliderDialog> {
  final _value = 0.0.obs;

  @override
  void initState() {
    _value.value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
          height: 100.0,
          width: 600.0,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Obx(
              (() => SfSlider(
                    max: widget.maxValue,
                    min: widget.minValue,
                    interval: widget.interval,
                    showLabels: true,
                    showDividers: true,
                    showTicks: true,
                    activeColor: Colors.blue.shade400,
                    inactiveColor: Colors.blue.shade200,
                    onChanged: (value) {
                      _value.value = value;
                    },
                    value: _value.value,
                  )),
            ),
          )),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(_value.value);
          },
        ),
      ],
    );
  }
}
