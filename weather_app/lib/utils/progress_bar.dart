import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final double progress;
  final double progressStatus;
  const ProgressBar(
      {super.key, required this.progress, required this.progressStatus});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: 20,
        child: Stack(
          children: [
            Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(15),
                  value: widget.progress,
                  backgroundColor: const Color(0xffDCDCDC),
                  color: const Color(0xFF6A5ACD),
                )),
            Align(
                alignment: Alignment.center,
                child: Text("${widget.progressStatus.toStringAsFixed(0)}%")),
          ],
        ));
  }
}
