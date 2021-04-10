// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "category" : MessageLookupByLibrary.simpleMessage("Category"),
    "favorite" : MessageLookupByLibrary.simpleMessage("Favorite"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "not_code" : MessageLookupByLibrary.simpleMessage("You didn\'t receive any code yet?"),
    "orders" : MessageLookupByLibrary.simpleMessage("Orders"),
    "phone_number" : MessageLookupByLibrary.simpleMessage("Phone Number"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profile"),
    "resend_cdoe" : MessageLookupByLibrary.simpleMessage("Resend Code"),
    "verification_code" : MessageLookupByLibrary.simpleMessage("Verification Code"),
    "verify_description" : MessageLookupByLibrary.simpleMessage("Urban Outlets sent a verification code\nto +91")
  };
}
