import 'package:flutter/widgets.dart';

class SwipeToAchieve extends StatefulWidget {
  final double width;
  final String title;
  final TextStyle textStyle;
  final Color achievedBackgroundColor;
  final Color startBackgroundColor;
  final Color startCircleColor;
  final Color achievedCircleColor;
  final double circleRadius;
  final ValueChanged onWhenEnd;
  final ValueChanged? onWhenReverse;
  const SwipeToAchieve({
    super.key,
    required this.width,
    required this.title,
    required this.textStyle,
    required this.achievedBackgroundColor,
    required this.startBackgroundColor,
    required this.startCircleColor,
    required this.circleRadius,
    required this.achievedCircleColor,
    required this.onWhenEnd,
    this.onWhenReverse,
  }) : assert(width >= 150.0);

  @override
  State<SwipeToAchieve> createState() => _SwipeToAchieveState();
}

class _SwipeToAchieveState extends State<SwipeToAchieve> {
  double _leftValue = 0.0;
  bool didAchieve = false;
  bool didStart = false;
  late Color _startBackgroundColor;
  late Color _startCircleColor;
  @override
  void initState() {
    super.initState();
    _startBackgroundColor = widget.startBackgroundColor;
    _startCircleColor = widget.startCircleColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: _startBackgroundColor,
        borderRadius: BorderRadius.circular(widget.circleRadius),
      ),
      height: 60.0,
      width: widget.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: widget.textStyle,
            ),
          ),
          Positioned(
            left: _leftValue,
            top: 0.0,
            child: GestureDetector(
              onPanUpdate: (details) => setState(() {
                _leftValue += details.delta.dx;
                didAchieve = false;
                didStart = false;
                if (_leftValue > widget.width - 60.0) {
                  _leftValue = widget.width - 60.0;
                  _startBackgroundColor = widget.achievedBackgroundColor;
                  _startCircleColor = widget.achievedCircleColor;
                  didAchieve = true;
                } else if (_leftValue < 0.0) {
                  _leftValue = 0.0;
                  didStart = true;
                  _startBackgroundColor == widget.startBackgroundColor
                      ? null
                      : _startBackgroundColor = widget.startBackgroundColor;
                  _startCircleColor == widget.startCircleColor
                      ? null
                      : _startCircleColor = widget.startCircleColor;
                }
              }),
              onPanEnd: didAchieve
                  ? widget.onWhenEnd
                  : didStart
                      ? widget.onWhenReverse
                      : (details) => setState(() {
                            if (_leftValue < widget.width - 60.0) {
                              _leftValue = 0.0;
                              _startBackgroundColor ==
                                      widget.startBackgroundColor
                                  ? null
                                  : _startBackgroundColor =
                                      widget.startBackgroundColor;
                              _startCircleColor == widget.startCircleColor
                                  ? null
                                  : _startCircleColor = widget.startCircleColor;
                            }
                          }),
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: _startCircleColor,
                  borderRadius: BorderRadius.circular(widget.circleRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
