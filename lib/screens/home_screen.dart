import 'package:app_scanner_qrcode/components/qr-code.widget.dart';
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? texto = '';

  int num_of_attempt_load = 0;
  int maxFailedLoadAttempts = 3;
  bool _isBannerAdReady = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _lerQrCode() {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => new QRCodeWidget(),
            ),
          );
          setState(() {
            texto = result;
          });
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Tooltip(
                  message: "Ler QRCODE",
                  child: Icon(Icons.qr_code_scanner_rounded,
                      color: Colors.black, size: 50),
                ),
              ),
              Expanded(
                child: Text(
                  'Ler QRCode',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gridviewCard(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.green[50],
            constraints: BoxConstraints(
              maxHeight: size.height * .50,
              maxWidth: size.width,
            ),
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: GridView.count(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              childAspectRatio: (size.height / 0.6 / size.width / 2),
              children: <Widget>[
                _lerQrCode(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildInputCodProduto() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        texto ?? "",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colours.red,
          title: const Row(
            children: [
              Icon(Icons.qr_code),
              SizedBox(
                width: 10.0,
              ),
              Text('QRCODE'),
            ],
          ),
        ),
        backgroundColor: Colours.swatch('#EDF6F9'),
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 70,
                        left: 10,
                        right: 10,
                      ),
                      child: _buildInputCodProduto(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _gridviewCard(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
