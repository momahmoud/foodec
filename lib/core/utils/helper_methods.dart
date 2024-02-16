import 'package:flutter/material.dart';

class HelperMethods {
  static BoxFit handleImageFit(String fitImage) {
    switch (fitImage) {
      case 'cover':
        return BoxFit.cover;
      case 'contain':
        return BoxFit.contain;
      case 'fill':
        return BoxFit.fill;
      case 'fit_height':
        return BoxFit.fitHeight;
      case 'fit_width':
        return BoxFit.fitWidth;
      case 'scale_down':
        return BoxFit.scaleDown;
      case 'none':
        return BoxFit.none;
      default:
        return BoxFit.cover;
    }
  }
}
