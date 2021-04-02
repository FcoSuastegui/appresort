import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumericStepButton extends StatelessWidget {
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;
  final Color iconButtonColor;
  final double iconSize, splashRadius;
  final TextStyle textStyle;
  final MainAxisAlignment mainAxisAlignment;

  NumericStepButton({
    Key key,
    this.minValue = 1,
    this.maxValue = 10,
    @required this.onChanged,
    this.iconButtonColor,
    this.iconSize = 32.0,
    this.textStyle,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    this.splashRadius = 20,
  })  : assert(onChanged != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NumericStepButtonController>(
      init: NumericStepButtonController(
        maxValue: maxValue,
        minValue: minValue,
      ),
      builder: (c) => Container(
        child: Obx(
          () => Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              IconButton(
                splashRadius: splashRadius,
                icon: Icon(
                  Icons.remove,
                  color: iconButtonColor ?? Theme.of(context).accentColor,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 10.0,
                ),
                iconSize: iconSize,
                color: iconButtonColor ?? Theme.of(context).primaryColor,
                onPressed: () {
                  c.decrement();
                  onChanged(c.counter);
                },
              ),
              Text(
                '${c.counter}',
                textAlign: TextAlign.center,
                style: textStyle ??
                    TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              IconButton(
                splashRadius: splashRadius,
                icon: Icon(
                  Icons.add,
                  color: iconButtonColor ?? Theme.of(context).accentColor,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 10.0,
                ),
                iconSize: iconSize,
                color: iconButtonColor ?? Theme.of(context).primaryColor,
                onPressed: () {
                  c.increment();
                  onChanged(c.counter);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumericStepButtonController extends GetxController {
  RxInt _counter = 1.obs;
  int get counter => _counter.value;
  set counter(int counter) => _counter(counter);

  final int maxValue, minValue;

  NumericStepButtonController({
    this.minValue = 1,
    this.maxValue = 10,
  });

  increment() => _counter < maxValue ? _counter++ : null;
  decrement() => _counter > minValue ? _counter-- : null;
}
