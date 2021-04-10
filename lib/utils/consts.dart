import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final phoneMask = new MaskTextInputFormatter(
    mask: '(###) ###-####', filter: {"#": RegExp(r'[0-9]')});

var token = 'Your token key';
var appID = 'app id';
