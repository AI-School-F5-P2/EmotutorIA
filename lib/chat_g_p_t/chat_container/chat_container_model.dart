import '/chat_g_p_t/writing_indicator/writing_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_container_widget.dart' show ChatContainerWidget;
import 'package:flutter/material.dart';

class ChatContainerModel extends FlutterFlowModel<ChatContainerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for writingIndicator component.
  late WritingIndicatorModel writingIndicatorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    writingIndicatorModel = createModel(context, () => WritingIndicatorModel());
  }

  @override
  void dispose() {
    writingIndicatorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
