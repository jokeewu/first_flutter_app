import 'package:fluro/fluro.dart';

import '../exception/router_handlers.dart' as exceptionHandlers;
import '../index/router_handlers.dart' as indexHandlers;
import '../list/router_handlers.dart' as listHandlers;
import '../form/router_handlers.dart' as formHandlers;
import '../upload/router_handlers.dart' as uploadHandlers;
import '../webview/router_handlers.dart' as webViewHandlers;

final router = new Router();

void init() {
  // Not Found
  router.notFoundHandler = exceptionHandlers.notFound;

  // 首页
  router.define('/index', handler: indexHandlers.index);
  
  // 列表/无限滚动
  router.define('/list', handler: listHandlers.list);
  router.define('/list/:id', handler: listHandlers.detail);

  // 表单
  router.define('/form', handler: formHandlers.form);

  // 上传
  router.define('/upload', handler: uploadHandlers.upload);

  // 打开网页
  router.define('/webview', handler: webViewHandlers.webview);
}