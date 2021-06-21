import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget{

  final Widget listItems;

  CustomDialog({this.listItems});

  @override
  Widget build(BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: listItems
                ),
              ),
          ],
        ),
        );
  }


}
