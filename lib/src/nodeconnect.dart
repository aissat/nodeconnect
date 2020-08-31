import 'dart:ffi';
import 'package:sprintf/sprintf.dart';

import 'package:ffi/ffi.dart';

import 'types.dart';
import 'signatures.dart';
import 'bindings.dart';

class Nodeconnect {
  static NodeConnectBindings _nc;
  static Pointer<Utf8> _server_cert;
  static Pointer<AcceptedCertType> _accepted_certs;

  Nodeconnect() {
    _nc = NodeConnectBindings();
  }



  static int _validate_peer_cert_cb(Pointer<Void> _vpninfo, Pointer<Utf8> reason) {
    // Pointer<AcceptedCertType> _this;

    if (_server_cert != null) {
      int err = _nc.nodeconnect_check_peer_cert_hash(_vpninfo, _server_cert);

      if (err == null) return 0;

      if (err < 0)
        print("Could not calculate hash of server's certificate\n");
      else {
        print("Server SSL certificate didn't match: %s\n");
        var fingerprint = _nc.nodeconnect_get_peer_cert_hash(_vpninfo);
        print(fingerprint.ref.toString());
      }

      return -22;
    }

    var fingerprint = _nc.nodeconnect_get_peer_cert_hash(_vpninfo);

    if (fingerprint == null) {
      print("Error getting peer's certificate hash\n");
      return -1;
    }

    if (_accepted_certs != null) {
      print("================================================");
      print('accepted_certs');
      print("================================================");
    }

    for (;;) {
      print(
          "\nCertificate from VPN server ${reason.ref} failed verification.\n");
      print("Reason: ${_nc.nodeconnect_get_hostname(_vpninfo).ref}  ");

      print(
          "To trust this server in future, perhaps add this to your command line:\n");
      print("    --servercert ${fingerprint.ref} ");

      Pointer<AcceptedCertType> newcert = allocate<AcceptedCertType>();
      if (newcert != null) {
        print("==================================");
        print('newcert');
        print("==================================");
        newcert = AcceptedCertType.allocate(
                fingerprint: fingerprint,
                host: _nc.nodeconnect_get_hostname(_vpninfo),
                port: _nc.nodeconnect_get_port(_vpninfo),
                next: _accepted_certs)
            .addressOf;
      }
      _accepted_certs = newcert;

      return 0;
    }
  }

  static int _process_auth_form_cb(Pointer<Void> vpninfo, Pointer<OcAuthForm> _form) {
    var form = _form.ref;
    var opts = form.opts;
    print("==================================");
    print('Processing auth form');
    print("==================================");

    if (opts != null) {
      var optValue = opts.ref;
      // print(form.authgroup_selection);
      // print(form.action.ref);
      // print(form.auth_id.ref);
      // print(form.banner.ref);
      // print(form.method.ref);

      print(form.message.ref);
      if (optValue.name.ref.toString() == 'username')
        _nc.nodeconnect_set_option_value(opts, Utf8.toUtf8("nodevpn"));
      else if (optValue.name.ref.toString() == 'password')
        _nc.nodeconnect_set_option_value(opts, Utf8.toUtf8("nodevpn"));
      print('${optValue.lable.ref} ${optValue.value.ref}');
      // print(optValue);

    } else {
      print(" null");
      return -22;
    }
    return 0;
  }

  static int _write_progress_cb(
      Pointer<Void> vpninfo,
      int level,
      Pointer<Utf8> fmt,
      Pointer<Utf8> arg0,
      Pointer<Utf8> arg1,
      Pointer<Utf8> arg2,
      Pointer<Utf8> arg3,
      Pointer<Utf8> arg4) {
    // print("===========");
    // print('fmt => ${fmt.ref}');
    print(sprintf(Utf8.fromUtf8(fmt),
        [arg0.ref, arg1.ref, arg2.ref, arg3.ref, arg4.ref]));
    // print(fmt.ref);

    // print("//===========");

    // print(level );
    return 0;
  }

  Pointer<Void> connect() {
    final newVpnInfo = _nc.nodeconnect_vpninfo_new(
        Utf8.toUtf8('nodeconnect'),
        Pointer.fromFunction<nodeconnect_validate_peer_cert_vfn_C>(
            _validate_peer_cert_cb, 0),
        nullptr,
        Pointer.fromFunction<nodeconnect_process_auth_form_vfn_C>(
            _process_auth_form_cb, 0),
        Pointer.fromFunction<nodeconnect_progress_vfn_C>(_write_progress_cb, 0),
        // nullptr,
        nullptr);
    if (newVpnInfo == nullptr) print("Failed to allocate vpninfo structure\n");
    _nc.nodeconnect_init_ssl();
    var res = _nc.nodeconnect_parse_url(
        newVpnInfo, Utf8.toUtf8("https://185.126.34.219"));
    print("url => $res");
    // // _nc.nodeconnect_set_protocol(newVpnInfo, Utf8.toUtf8("anyconnect"));
    res = _nc.nodeconnect_obtain_cookie(newVpnInfo);
    if (res != 0)
      print("Failed to obtain cookie $res");
    else
      print("Cookie obtained  $res");

    print("==================================");

    res = _nc.nodeconnect_make_cstp_connection(newVpnInfo);
    if (res != 0)
      print("Failed to make CSTP connection $res");
    else
      print("CSTP connection established $res");

    res = _nc.nodeconnect_setup_tun_device(
        newVpnInfo, Utf8.toUtf8('nodeconnect/lib/src/util/vpnc-script'), nullptr);
    if (res != 0)
      print("Failed to steup TUN device  $res");
    else
      print("TUN device setup  $res");

    while (true) {
      var ret = _nc.nodeconnect_mainloop(newVpnInfo, 300, 10);
      if (ret == null) break;
    }

    return newVpnInfo;
  }
}
