import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'signatures.dart';
import 'types.dart';
import 'util/dylib_utils.dart';

class NodeConnectBindings {
  DynamicLibrary nodeconnect;

  /// C function `nodeconnect_get_version`.
  ///
  ///

  Pointer<Utf8> Function() nodeconnect_get_version;

  /// C function `nodeconnect_vpninfo_new`.
  ///
  ///
  Pointer<Void> Function(
    Pointer<Utf8> useragent,
    Pointer<NativeFunction<nodeconnect_validate_peer_cert_vfn_C>>
        validate_peer_cert_vfn,
    Pointer nodeconnect_write_new_config_vfn,
    Pointer<NativeFunction<nodeconnect_process_auth_form_vfn_C>>
        nodeconnect_process_auth_form_vfn,
    Pointer<NativeFunction<nodeconnect_progress_vfn_C>>
        nodeconnect_progress_vfn,
    Pointer<Void> privdata,
  ) nodeconnect_vpninfo_new;

  /// C function `nodeconnect_init_ssl`.
  ///
  ///
  int Function() nodeconnect_init_ssl;

  /// C func `nodeconnect_parse_url_func`.
  ///
  ///
  int Function(Pointer<Void> privdata, Pointer<Utf8>) nodeconnect_parse_url;

  /// C func `nodeconnect_set_reported_os_func`.
  ///
  ///
  int Function(Pointer<Void> privdata, Pointer<Utf8>)
      nodeconnect_set_reported_os;

  /// C func `nodeconnect_set_protocol_func`.
  ///
  ///
  int Function(Pointer<Void> privdata, Pointer<Utf8>) nodeconnect_set_protocol;

  /// C func `nodeconnect_obtain_cookie_func`.
  ///
  ///
  int Function(Pointer<Void> privdata) nodeconnect_obtain_cookie;

  /// C func `nodeconnect_set_option_value_func`.
  ///
  ///
  int Function(Pointer<OcFormOpt> opt, Pointer<Utf8>)
      nodeconnect_set_option_value;

  /// C func `nodeconnect_make_cstp_connection_func`.
  ///
  ///
  int Function(Pointer<Void> privdata) nodeconnect_make_cstp_connection;

  /// C func `nodeconnect_setup_dtls_func`.
  ///
  ///
  int Function(Pointer<Void> privdata, int) nodeconnect_setup_dtls;

  /// C func `nodeconnect_setup_tun_device_func`.
  ///
  ///
  int Function(Pointer<Void> privdata, Pointer<Utf8>, Pointer<Utf8>)
      nodeconnect_setup_tun_device;

  /// C func `nodeconnect_get_port_func`.
  ///
  ///
  int Function(Pointer<Void> privdata) nodeconnect_get_port;

  /// C func `nodeconnect_get_hostname_func`.
  ///
  ///
  Pointer<Utf8> Function(Pointer<Void> privdata) nodeconnect_get_hostname;

  /// C func `nodeconnect_get_peer_cert_hash_func`.
  ///
  ///
  Pointer<Utf8> Function(Pointer<Void> privdata) nodeconnect_get_peer_cert_hash;

  /// C func `nodeconnect_check_peer_cert_hash_func`.
  ///
  ///
  int Function(Pointer<Void> privdata, Pointer<Utf8>)
      nodeconnect_check_peer_cert_hash;

  /// C func `nodeconnect_mainloop_func`.
  ///
  ///
  int Function(Pointer<Void> privdata, int, int) nodeconnect_mainloop;

  NodeConnectBindings() {
    nodeconnect = dlopenPlatformSpecific("openconnect");

    nodeconnect_get_version = nodeconnect
        .lookup<NativeFunction<nodeconnect_get_version_func>>(
            'openconnect_get_version')
        .asFunction();

    nodeconnect_vpninfo_new = nodeconnect
        .lookup<NativeFunction<nodeconnect_vpninfo_new_func>>(
            'openconnect_vpninfo_new')
        .asFunction();

    nodeconnect_init_ssl = nodeconnect
        .lookup<NativeFunction<nodeconnect_init_ssl_func>>(
            'openconnect_init_ssl')
        .asFunction();

    nodeconnect_parse_url = nodeconnect
        .lookup<NativeFunction<nodeconnect_parse_url_func>>(
            'openconnect_parse_url')
        .asFunction();

    nodeconnect_set_reported_os = nodeconnect
        .lookup<NativeFunction<nodeconnect_set_reported_os_func>>(
            'openconnect_set_reported_os')
        .asFunction();
    nodeconnect_set_protocol = nodeconnect
        .lookup<NativeFunction<nodeconnect_set_protocol_func>>(
            'openconnect_set_protocol')
        .asFunction();
    nodeconnect_obtain_cookie = nodeconnect
        .lookup<NativeFunction<nodeconnect_obtain_cookie_func>>(
            'openconnect_obtain_cookie')
        .asFunction();
    nodeconnect_set_option_value = nodeconnect
        .lookup<NativeFunction<nodeconnect_set_option_value_func>>(
            'openconnect_set_option_value')
        .asFunction();
    nodeconnect_make_cstp_connection = nodeconnect
        .lookup<NativeFunction<nodeconnect_make_cstp_connection_func>>(
            'openconnect_make_cstp_connection')
        .asFunction();
    nodeconnect_setup_dtls = nodeconnect
        .lookup<NativeFunction<nodeconnect_setup_dtls_func>>(
            'openconnect_setup_dtls')
        .asFunction();
    nodeconnect_setup_tun_device = nodeconnect
        .lookup<NativeFunction<nodeconnect_setup_tun_device_func>>(
            'openconnect_setup_tun_device')
        .asFunction();
    nodeconnect_get_port = nodeconnect
        .lookup<NativeFunction<nodeconnect_get_port_func>>(
            'openconnect_get_port')
        .asFunction();
    nodeconnect_get_hostname = nodeconnect
        .lookup<NativeFunction<nodeconnect_get_hostname_func>>(
            'openconnect_get_hostname')
        .asFunction();
    nodeconnect_get_peer_cert_hash = nodeconnect
        .lookup<NativeFunction<nodeconnect_get_peer_cert_hash_func>>(
            'openconnect_get_peer_cert_hash')
        .asFunction();
    nodeconnect_check_peer_cert_hash = nodeconnect
        .lookup<NativeFunction<nodeconnect_check_peer_cert_hash_func>>(
            'openconnect_check_peer_cert_hash')
        .asFunction();
    nodeconnect_mainloop = nodeconnect
        .lookup<NativeFunction<nodeconnect_mainloop_func>>(
            'openconnect_mainloop')
        .asFunction();
  }
}
