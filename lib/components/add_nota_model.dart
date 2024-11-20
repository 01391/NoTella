import '/flutter_flow/flutter_flow_util.dart';
import 'add_nota_widget.dart' show AddNotaWidget;
import 'package:flutter/material.dart';

class AddNotaModel extends FlutterFlowModel<AddNotaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Titolo widget.
  FocusNode? titoloFocusNode;
  TextEditingController? titoloTextController;
  String? Function(BuildContext, String?)? titoloTextControllerValidator;
  // State field(s) for Descrizione widget.
  FocusNode? descrizioneFocusNode;
  TextEditingController? descrizioneTextController;
  String? Function(BuildContext, String?)? descrizioneTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titoloFocusNode?.dispose();
    titoloTextController?.dispose();

    descrizioneFocusNode?.dispose();
    descrizioneTextController?.dispose();
  }
}
