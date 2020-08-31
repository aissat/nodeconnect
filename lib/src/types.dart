import "dart:ffi";

import 'package:ffi/ffi.dart';

class OpenconnectInfo extends Struct {}

class AcceptedCertType extends Struct {
  Pointer<Utf8> fingerprint;
  Pointer<Utf8> host;
  @Int32()
  int port;
  Pointer<AcceptedCertType> next;
  factory AcceptedCertType.allocate(
      {Pointer<Utf8> fingerprint,
      Pointer<Utf8> host,
      int port,
      Pointer<AcceptedCertType> next}) {
    return allocate<AcceptedCertType>().ref
      ..fingerprint = fingerprint
      ..host = host
      ..port = port
      ..next = next;
  }
}

class OcFormOpt extends Struct {
  Pointer<OcFormOpt> next;
  @Int32()
  int type;
  Pointer<Utf8> name;
  Pointer<Utf8> lable;
  Pointer<Utf8> _value;

  @Uint32()
  int flags;
  Pointer reserved;

  Pointer<Utf8> get value => _value;

  factory OcFormOpt.allocate(
    Pointer<OcFormOpt> next,
    @Int32() int type,
    Pointer<Utf8> name,
    Pointer<Utf8> lable,
    Pointer<Utf8> value,
    @Int32() int flags,
    Pointer<void> reserved,
  ) {
    return allocate<OcFormOpt>().ref
      ..next = next
      ..type = type
      ..name = name
      ..lable = lable
      .._value = value
      ..flags = flags
      ..reserved = reserved;
  }

  @override
  String toString() {
    return 'OcFormOpt(next: ${next}, type: ${type}, name: ${name.ref}, lable: ${lable.ref}, _value: ${_value.ref}, flags: ${flags}, reserved: ${reserved})';
  }
}

//oc_choice
class OcChoice extends Struct {
  Pointer<Utf8> auth_type;
  Pointer<Utf8> lable;
  Pointer<Utf8> name;
  Pointer<Utf8> override_name;
  Pointer<Utf8> override_label;
}

//oc_form_opt_select
class OcFormOptSelect extends Struct {
  Pointer<OcFormOpt> opts;
  @Int32()
  int nr_choices;
  Pointer<OcChoice> choices;
}

class OcAuthForm extends Struct {
  Pointer<Utf8> banner;
  Pointer<Utf8> message;
  Pointer<Utf8> error;
  Pointer<Utf8> auth_id;
  Pointer<Utf8> method;
  Pointer<Utf8> action;
  Pointer<OcFormOpt> opts;
  Pointer<OcFormOptSelect> authgroup_opt;
  @Int32()
  int authgroup_selection;

  factory OcAuthForm.allocate(
      Pointer<Utf8> banner,
      Pointer<Utf8> message,
      Pointer<Utf8> error,
      Pointer<Utf8> auth_id,
      Pointer<Utf8> method,
      Pointer<Utf8> action,
      Pointer<OcFormOpt> opts,
      Pointer<OcFormOptSelect> authgroup_opt,
      int authgroup_selection) {
    return allocate<OcAuthForm>().ref
      ..banner = banner
      ..message = message
      ..error = error
      ..auth_id = auth_id
      ..method = method
      ..action = action
      ..authgroup_selection = authgroup_selection
      ..authgroup_opt = authgroup_opt
      ..opts;
  }
}
