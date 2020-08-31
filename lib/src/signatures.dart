import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'types.dart';

/// C Callback .
///
///
typedef Int32 nodeconnect_validate_peer_cert_vfn_C(
    Pointer<Void> privdata, Pointer<Utf8> reason);
typedef Int32 nodeconnect_process_auth_form_vfn_C(
    Pointer<Void> privdata, Pointer<OcAuthForm> form);
typedef Int32 nodeconnect_progress_vfn_C(
    Pointer<Void> privdata, Int32 level,Pointer<Utf8>  fmt, Pointer<Utf8>  arg0,Pointer<Utf8>  arg1, Pointer<Utf8>  arg2,Pointer<Utf8>  arg3, Pointer<Utf8>  arg4);



/// C func `nodeconnect_get_version_func`.
///
///
typedef nodeconnect_get_version_func = Pointer<Utf8> Function();



/// C func `nodeconnect_vpninfo_new_func`.
///
///
typedef nodeconnect_vpninfo_new_func = Pointer<Void> Function(
  Pointer<Utf8> useragent,
  Pointer<NativeFunction<nodeconnect_validate_peer_cert_vfn_C>>
      validate_peer_cert_vfn,
  Pointer nodeconnect_write_new_config_vfn,
  Pointer<NativeFunction<nodeconnect_process_auth_form_vfn_C>>
      nodeconnect_process_auth_form_vfn,
  Pointer<NativeFunction<nodeconnect_progress_vfn_C>> nodeconnect_progress_vfn,
  Pointer<Void> privdata,
);


/// C func `nodeconnect_init_ssl_func`.
///
///
typedef nodeconnect_init_ssl_func = Int32 Function();

/// C func `nodeconnect_parse_url_func`.
///
///
typedef nodeconnect_parse_url_func = Int32 Function(Pointer<Void> privdata, Pointer<Utf8>);

/// C func `nodeconnect_set_reported_os_func`.
///
///
typedef nodeconnect_set_reported_os_func = Int32 Function(
    Pointer<Void> privdata, Pointer<Utf8>);

/// C func `nodeconnect_set_protocol_func`.
///
///
typedef nodeconnect_set_protocol_func = Int32 Function(Pointer<Void> privdata, Pointer<Utf8>);

/// C func `nodeconnect_obtain_cookie_func`.
///
///
typedef nodeconnect_obtain_cookie_func = Int32 Function(Pointer<Void> privdata);

/// C func `nodeconnect_set_option_value_func`.
///
///
typedef nodeconnect_set_option_value_func = Int32 Function(
    Pointer<OcFormOpt> opt, Pointer<Utf8>);

/// C func `nodeconnect_make_cstp_connection_func`.
///
///
typedef nodeconnect_make_cstp_connection_func = Int32 Function(
    Pointer<Void> privdata);

/// C func `nodeconnect_setup_dtls_func`.
///
///
typedef nodeconnect_setup_dtls_func = Int32 Function(Pointer<Void> privdata, Int32);

/// C func `nodeconnect_setup_tun_device_func`.
///
///
typedef nodeconnect_setup_tun_device_func = Int32 Function(
    Pointer<Void> privdata, Pointer<Utf8>, Pointer<Utf8>);

/// C func `nodeconnect_get_port_func`.
///
///
typedef nodeconnect_get_port_func = Int32 Function(Pointer<Void> privdata);

/// C func `nodeconnect_get_hostname_func`.
///
///
typedef nodeconnect_get_hostname_func = Pointer<Utf8> Function(Pointer<Void> privdata);

/// C func `nodeconnect_get_peer_cert_hash_func`.
///
///
typedef nodeconnect_get_peer_cert_hash_func = Pointer<Utf8> Function(
    Pointer<Void> privdata);

/// C func `nodeconnect_check_peer_cert_hash_func`.
///
///
typedef nodeconnect_check_peer_cert_hash_func = Int32 Function(
    Pointer<Void> privdata, Pointer<Utf8>);

/// C func `nodeconnect_mainloop_func`.
///
///
typedef nodeconnect_mainloop_func = Int32 Function(Pointer<Void> privdata, Int32, Int32);
