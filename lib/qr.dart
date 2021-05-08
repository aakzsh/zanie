import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:genie/home.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    if (result.code == "https://devpost.com")
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        },
                        child: Text("Success! click me im desperate"),
                      )
                    else
                      Text("not the right code ")
                  else
                    Text(
                      'Scan a code',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.deepPurpleAccent,
                                Colors.pink[800]
                                // Color(0x262427),
                                // Color(0x4815DA)
                              ],
                            )),
                        height: 40,
                        width: 100,
                        // color: Colors.pink,
                        margin: EdgeInsets.all(8),
                        child: MaterialButton(
                            onPressed: () => setState(() {
                                  controller?.toggleFlash();
                                }),
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text(
                                  'Flash: ${snapshot.data}',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                );
                              },
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.deepPurpleAccent,
                                Colors.pink[800]
                                // Color(0x262427),
                                // Color(0x4815DA)
                              ],
                            )),
                        height: 40,
                        width: 100,
                        // color: Colors.pink,
                        margin: EdgeInsets.all(8),
                        child: MaterialButton(
                            onPressed: () => setState(() {
                                  controller?.flipCamera();
                                }),
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Center(
                                      child: Text(
                                    'Camera:\n${describeEnum(snapshot.data)}',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ));
                                } else {
                                  return Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 100,
                        margin: EdgeInsets.all(8),
                        child: MaterialButton(
                          onPressed: () {
                            controller?.pauseCamera();
                          },
                          child: Text('pause',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black87,
                                Colors.deepPurple
                                // Color(0x262427),
                                // Color(0x4815DA)
                              ],
                            )),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        margin: EdgeInsets.all(8),
                        child: MaterialButton(
                          onPressed: () {
                            controller?.resumeCamera();
                          },
                          child: Text('resume',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black87,
                                Colors.deepPurple
                                // Color(0x262427),
                                // Color(0x4815DA)
                              ],
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.front,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
