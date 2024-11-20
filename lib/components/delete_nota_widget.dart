import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'delete_nota_model.dart';
export 'delete_nota_model.dart';

class DeleteNotaWidget extends StatefulWidget {
  const DeleteNotaWidget({
    super.key,
    required this.noteDoc,
  });

  final DocumentReference? noteDoc;

  @override
  State<DeleteNotaWidget> createState() => _DeleteNotaWidgetState();
}

class _DeleteNotaWidgetState extends State<DeleteNotaWidget> {
  late DeleteNotaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteNotaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.noteDoc!.delete();
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: const Color(0xFFFF000E),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'ap8qjy3u' /* Elimina */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Inter',
                    color: const Color(0xFFF9000E),
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
