import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final phoneMask = new MaskTextInputFormatter(
    mask: '(###) ###-####', filter: {"#": RegExp(r'[0-9]')});

var token = 'secret_c8gQW5Y2d4BehpA9nJmgdmcnVNzL2DFB';
var appID = '54679246';
