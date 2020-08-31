class NcFormFlag {
  static const int NC_FORM_OPT_TEXT = 1;
  static const int NC_FORM_OPT_PASSWORD = 2;
  static const int NC_FORM_OPT_SELECT = 3;
  static const int NC_FORM_OPT_HIDDEN = 4;
  static const int NC_FORM_OPT_TOKEN = 5;

  static const int NC_FORM_RESULT_ERR = -1;
  static const int NC_FORM_RESULT_OK = 0;
  static const int NC_FORM_RESULT_CANCELLED = 1;
  static const int NC_FORM_RESULT_NEWGROUP = 2;


static const int  OC_FORM_OPT_IGNORE	=	0x0001;
static const int  OC_FORM_OPT_NUMERIC	=	0x0002;

}

class NcTokenMode {
  static const int NC_TOKEN_MODE_NONE = 0;
  static const int NC_TOKEN_MODE_STOKEN = 1;
  static const int NC_TOKEN_MODE_TOTP = 2;
  static const int NC_TOKEN_MODE_HOTP = 3;
  static const int NC_TOKEN_MODE_YUBIOATH = 4;
  static const int NC_TOKEN_MODE_OIDC = 5;
}
