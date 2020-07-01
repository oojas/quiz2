import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/question/qclass.dart';

class pok extends StatefulWidget {
  @override
  _pokState createState() => _pokState();
}

class _pokState extends State<pok> {
  int _questionindex = 0;
  List _questionbank = [
    questionandsnwer.init("Q1 Is Hassan Rouhani the President of Iran?", true),
    questionandsnwer.init(
        "Q2 Is Zakir Hussain the foreign Minister of Pakistan?", false),
    questionandsnwer.init(
        "Q3  The Prime Minister of United Kingdom is Elizabeth||?", false),
    questionandsnwer.init(
        "Q4 The Prime Minister of France is Emmanuel Macron?", true),
    questionandsnwer.init("Q5 Isarel got independence in 1949?", true),
    questionandsnwer.init("Q6 Ankara is the capital of Turkey?", true),
    questionandsnwer.init(
        "Q7 The Defense Minister of India is Nirmala Sitaram?", false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("True Citizen",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
      ),
    //  backgroundColor: Colors.blueGrey,
      body: Builder(
        //builder here is used to save the context and connect it to our function.
        //Context helps in determining the functions and dynamicity of the function.
        builder: (BuildContext context) => Container(
          //this is how you use builder.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    //It is used to upload the images into our application.
                    "images/flag.png",
                    width: 250,
                    height: 180,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(18.9),
                        border: Border.all(
                            color: Colors.blueGrey.shade400,
                            style: BorderStyle.solid)),
                    height: 120.0,
                    width: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          _questionbank[_questionindex]
                              .question, //here we made a class and used it fro our question and answers.
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        color: Colors.transparent,
                        textColor: Colors.white,
                        child: Text(
                          "True",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => _checkanswer(true, context)),
                    RaisedButton(
                        color: Colors.transparent,
                        textColor: Colors.white,
                        child: Text(
                          "False",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => _checkanswer(false, context)),
                    RaisedButton(
                        color: Colors.transparent,
                        textColor: Colors.white,
                        child: Text(
                          "Next Question",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => _nextquestion()),
                  ],
                ),
              ),

//            Center(
//              child: Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Column(
//                  children: <Widget>[
//                    Center(
//                      child: TextField(
//                        keyboardType: TextInputType.text,
//                        style: TextStyle(
//                            color: Colors.white, fontWeight: FontWeight.bold),
//                        decoration: InputDecoration(
//                            prefixText: "Your Answer",
//                            prefixIcon: Icon(Icons.text_fields),
//                            fillColor: Colors.white),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            )
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  //we are using snackbar in some other function that is why we have to use context variable.
  _checkanswer(bool userchoice, BuildContext context) {
    if (userchoice == _questionbank[_questionindex].answer) {
      //this is the way in which you can extract questions
      // and answers from the class

      final snackbar = SnackBar(
        content: Text(
          "Correct !",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.green,
      );
      Scaffold.of(context).showSnackBar(snackbar);
      debugPrint("True");
    } else {
      final snackbar = SnackBar(
        content: Text(
          "InCorrect !",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.deepOrange,
      );
      Scaffold.of(context).showSnackBar(snackbar);

      debugPrint("False");
    }
  }

  _nextquestion() {
    setState(() {
      if (_questionindex >= 7) {
        //Do Nothing
      } else {
        _questionindex = (_questionindex + 1) % _questionbank.length;
      } //After 7th question it again takes you to the
      //question number 1.
    });
  }
}
