import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

void main() async {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Corso Flutter - Presentazioni'),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black
            ),
            child: StreamBuilder(
              // This streamBuilder reads the real-time status of SlimyCard.
              initialData: false,
              stream: slimyCard.stream, //Stream of SlimyCard
              builder: ((BuildContext context, AsyncSnapshot snapshot) {
                return ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(height: 10),

                    // SlimyCard is being called here.
                    SlimyCard(
                      // In topCardWidget below, imagePath changes according to the
                      // status of the SlimyCard(snapshot.data).
                      width: 350.0,
                      topCardWidget: topCardWidget(snapshot.data),
                      bottomCardWidget: bottomCardWidget(snapshot.data),
                      topCardHeight: 300.0,
                      bottomCardHeight: 150.0,
                      slimeEnabled: true,
                    ),
                  ],
                );
              }),
            ),
          ),
        ));
  }

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget(bool isExpanded) {
    String imagePath = isExpanded
        ? 'assets/images/foto_luca.jpeg'
        : 'assets/images/flutter_logo.png';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 5.0,
              color: Colors.white
            ),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(
          isExpanded ? '' : 'Corso Dart & Flutter',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget(bool isExpanded) {
    print(isExpanded.toString());
    return isExpanded ? Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'LUCA PANTEGHINI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Software Engineer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic
            ),
            textAlign: TextAlign.center,
          )
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mail,
                color: Colors.white,
                size: 24.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'lucaspanthe@gmail.com',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        )

      ],
    ) : SizedBox.shrink();
  }
}
