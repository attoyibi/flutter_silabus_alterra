import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      endDrawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              // color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
        child: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
          ),
          actions: [],
          elevation: 4,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  constraints: BoxConstraints(
                    maxWidth: double.infinity,
                    maxHeight: 500,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        'data:image/jpeg;base64,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',
                      ).image,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 40, 50, 0),
                        // child: GradientText(
                        //   'Coding Bootcamp Penghasil Programmer dengan Kualitas Tinggi di Indonesia 1',
                        //   textAlign: TextAlign.center,
                        //   style: FlutterFlowTheme.of(context).title1.override(
                        //         fontFamily: 'Roboto',
                        //         color: Colors.white,
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //   colors: [Colors.white],
                        //   gradientDirection: GradientDirection.ltr,
                        //   gradientType: GradientType.linear,
                        // ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 10, 50, 0),
                        child: Text(
                          'Alterra Academy adalah coding bootcamp Indonesia untuk semua orang, baik dengan background IT & non-IT untuk menjadi Programmer dengan kualitas terbaik di Industri saat ini.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 250,
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                      // color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                  // child: ContactusWidget(),
                ),
                Container(
                  width: 100,
                  height: 500,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: 600,
                  ),
                  decoration: BoxDecoration(
                      // color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Text(
                          'About Us',
                          style: TextStyle(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 20),
                        child: Text(
                          'Alterra Academy Programs',
                          style: TextStyle(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // CardAboutUsWidget(),
                            // CardAboutUsWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
