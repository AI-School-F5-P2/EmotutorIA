import '/flutter_flow/flutter_flow_util.dart';
import 'test_button_widget.dart' show TestButtonWidget;
import 'package:flutter/material.dart';

class TestButtonModel extends FlutterFlowModel<TestButtonWidget> {
  ///  Local state fields for this component.

  List<bool> pulsed = [true, false];
  void addToPulsed(bool item) => pulsed.add(item);
  void removeFromPulsed(bool item) => pulsed.remove(item);
  void removeAtIndexFromPulsed(int index) => pulsed.removeAt(index);
  void insertAtIndexInPulsed(int index, bool item) =>
      pulsed.insert(index, item);
  void updatePulsedAtIndex(int index, Function(bool) updateFn) =>
      pulsed[index] = updateFn(pulsed[index]);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
