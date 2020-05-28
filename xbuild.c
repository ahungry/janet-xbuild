#include <janet.h>

static Janet
hi_wrapped (int32_t argc, Janet *argv)
{
  return janet_wrap_integer (3);
}

static const JanetReg
xbuild_cfuns[] = {
  {"hi", hi_wrapped, ""},
  {NULL,NULL,NULL}
};

/* extern const unsigned char *pobox_lib_embed; */
/* extern size_t pobox_lib_embed_size; */

JANET_MODULE_ENTRY (JanetTable *env) {
  janet_cfuns (env, "xbuild", xbuild_cfuns);
  /* janet_dobytes(env, */
  /*               pobox_lib_embed, */
  /*               pobox_lib_embed_size, */
  /*               "pobox_lib.janet", */
  /*               NULL); */
}
