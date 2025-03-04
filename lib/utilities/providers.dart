import "package:provider/single_child_widget.dart";

import "../controller/search_controller.dart";
import "package:provider/provider.dart";

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => PageSearchController()),
];
