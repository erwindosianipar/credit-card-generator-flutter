import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(FirstScreen());

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State {
  var cardName;
  var cardNumb;
  List<CreditCard> listCardCredit = List<CreditCard>();

  var clearTextName = TextEditingController();
  var clearTextNumb = TextEditingController();

  handleInputText(text) {
    setState(() {
      this.cardName = text;
    });
    print(this.cardName);
  }

  handleInputNumb(text) {
    setState(() {
      this.cardNumb = text;
    });
    print(this.cardNumb);
  }

  addMessage() {
    setState(() {
      if (cardName==null) cardName = "";
      if (cardNumb==null) cardNumb = "";

      var newCard = CreditCard(name: cardName, cardNumb: cardNumb);
      this.listCardCredit.add(newCard);
    });

    clearTextName.clear();
    clearTextNumb.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Credit Card Apps",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: new EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: clearTextName,
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Your Name',
                    ),
                    onChanged: handleInputText,
                  ),
                  Text(""),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: clearTextNumb,
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CC Number',
                    ),
                    onChanged: handleInputNumb,
                  ),
                  Text(""),
                  RaisedButton(
                    onPressed: addMessage,
                    color: Colors.deepPurple,
                    child: Text("GENERATE CARD"),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: listCardCredit.length, itemBuilder: rowBuilder),
            )
          ],
        ),
      ),
    );
  }

  Widget rowBuilder(BuildContext context, int index) {
    return CreditCardWidget(
      cardNumber: listCardCredit[index].cardNumb,
      cardHolderName: listCardCredit[index].name,
      expiryDate: "00/00",
      cvvCode: "5222",
      height: 200,
      showBackView: false,
      width: MediaQuery.of(context).size.width,
      animationDuration: Duration(milliseconds: 1000),
    );
  }
}

class CreditCard {
  String name = "";
  String cardNumb = "";

  CreditCard({this.name, this.cardNumb});
}
