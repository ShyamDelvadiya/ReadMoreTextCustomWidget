import 'package:flutter/material.dart';

class CustomReadMoreWidget extends StatefulWidget {
  final String data;
  final String readMoreText;
  final String readLessText;
  bool isExpanded;
  bool animation;
  TextStyle? readLessTextStyle;
  TextStyle? readMoreTextStyle;
  TextStyle? dataTextStyle;
  int maxLines = 3;
  final Widget? readLessWidget;
  final Widget? readMoreWidget;
  Color? iconColor;
  double? iconSize;
  int animationDuration;
  Curve collapsedAnimationCurve;
  Curve expandedAnimationCurve;

  CustomReadMoreWidget({
    Key? key,
    this.readMoreText = 'Read More',
    this.readLessText = 'Read Less',
    required this.data,
    this.dataTextStyle,
    this.maxLines = 3,
    this.isExpanded = false,
    this.animation = true,
    this.iconSize,
    this.readLessTextStyle,
    this.collapsedAnimationCurve = Curves.linear,
    this.expandedAnimationCurve = Curves.linear,
    this.readMoreWidget,
    this.readLessWidget,
    this.readMoreTextStyle,
    this.iconColor,
    this.animationDuration = 300,
  }) : super(key: key);

  @override
  State<CustomReadMoreWidget> createState() => _CustomReadMoreWidgetState();
}

class _CustomReadMoreWidgetState extends State<CustomReadMoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.animation)
            ? AnimatedCrossFade(
            duration: Duration(milliseconds: widget.animationDuration),
            firstCurve: widget.collapsedAnimationCurve,
            secondCurve: widget.expandedAnimationCurve,
            crossFadeState: widget.isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Text(
              widget.data,
              maxLines: null,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.start,
              style: widget.dataTextStyle,
            ),
            secondChild: Text(
              widget.data,
              maxLines: widget.maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: widget.dataTextStyle,
            ))
            : Text(
          widget.data,
          maxLines: widget.isExpanded ? null : widget.maxLines,
          overflow: widget.isExpanded
              ? TextOverflow.visible
              : TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: widget.dataTextStyle,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.isExpanded = !widget.isExpanded;
            });
          },
          child:
          (widget.readMoreWidget == null || widget.readLessWidget == null)
              ? Row(
            children: [
              Text(
                widget.isExpanded
                    ? widget.readLessText
                    : widget.readMoreText,
                style: widget.isExpanded
                    ? widget.readLessTextStyle
                    : widget.readMoreTextStyle,
              ),
              Icon(
                widget.isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: widget.iconColor,
                size: widget.iconSize ?? IconTheme.of(context).size!,
              ),
            ],
          )
              : widget.isExpanded
              ? widget.readLessWidget!
              : widget.readMoreWidget!,
        ),
      ],
    );
  }
}