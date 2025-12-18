import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_account3_model.dart';
export 'create_account3_model.dart';

class CreateAccount3Widget extends StatefulWidget {
  const CreateAccount3Widget({super.key});

  static String routeName = 'CreateAccount3';
  static String routePath = '/createAccount3';

  @override
  State<CreateAccount3Widget> createState() => _CreateAccount3WidgetState();
}

class _CreateAccount3WidgetState extends State<CreateAccount3Widget> {
  late CreateAccount3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAccount3Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: 100.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4B39EF), Color(0xFFEE8B60)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.87, -1.0),
                    end: AlignmentDirectional(-0.87, 1.0),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, -1.0),
                child: FlutterFlowWebView(
                  content: 'https://dev.safezi.co/reports/b6',
                  bypass: false,
                  height: 917.55,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
