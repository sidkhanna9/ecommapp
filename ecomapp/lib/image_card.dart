import 'package:flutter/material.dart';
import 'package:ecomapp/model.dart';

class ImageCard extends StatelessWidget {
  ImageCard(this.image);
  final Images image;

  BoxDecoration _buildShadowAndRoundedCorners() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          spreadRadius: 2.0,
          blurRadius: 10.0,
          color: Colors.black26,
        ),
      ],
    );
  }

  Widget _buildThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Align(
    alignment: Alignment.topCenter,
    heightFactor: 2,
    widthFactor: 2,
    child: Image.asset(image.thumbnail,
    fit: BoxFit.fitHeight),
  ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: _buildShadowAndRoundedCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: _buildThumbnail()),
          //Flexible(flex: 2, child: _buildInfo()),
        ],
      ),
    );
  }
}