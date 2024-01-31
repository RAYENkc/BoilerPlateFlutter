import 'package:flutter/material.dart';

class KeysStorage {
  static final GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>();

  static const textFieldKey1 =  Key('__RIKEY1__');
  static const textFieldKey2 =  Key('__RIKEY2__');
    static const textFieldKey6 =  Key('__RIKEY6__');
  static const textFieldKey7 =  Key('__RIKEY7__');
    static const textFieldKey8 =  Key('__RIKEY8__');
  static const textFieldKey9 =  Key('__RIKEY9__');
  static const textFieldKey10 =  Key('__RIKEY10__');

  static const textFieldKeyOldPWD =  Key('__RIKEY3__');
  static const textFieldKeyNewPWD =  Key('__RIKEY4__');
  static const textFieldKeyConfirmPWD =  Key('__RIKEY5__');
  
}
