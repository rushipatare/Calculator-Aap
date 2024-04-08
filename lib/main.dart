import 'package:calculator_aap2/colors.%20dart.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(const MaterialApp(
    home: CalculatorAap() ,
  ));
}
class CalculatorAap  extends StatefulWidget {
  const CalculatorAap ({super.key});

  @override
  State<CalculatorAap> createState() => _State();
}

class _State extends State<CalculatorAap> {
  get buttonBgColor => null;
//variable
  double firstNum=0.0;
  double secondNum=0.0;
  var input='';
  var output='';
  var operation='';
  var hideInput = false;
  var outputSize = 34.0;

  get expression => null;
  onButtonClick(value){
    //if value is AC
    
    if (value== "AC"){
      input='';
      output='';}
    else if(value== "<"){
      if (input.isNotEmpty) {
        input = input.substring(0,input.length- 1);
      }
    } else if (value== "="){
      if(input.isNotEmpty) ;
      var userInput = input;
      userInput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression= p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL,cm);
      output =finalValue.toString();
      if (output.endsWith("0") ) {
        output = output.substring(0, output.length - 2);
      }
      input= output;
      hideInput = true;
      outputSize= 52;

    } else{
      input = input+ value;
      hideInput = false;
      outputSize= 34;

    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body:Column(
        children: [

          Expanded(child: Container(
            width: double.infinity,


            padding: const EdgeInsets.all(12),

              color: Colors.white54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' :
                    input,style: TextStyle(fontSize: 48,color: Colors.white),),
                  SizedBox(height: 20,),
                  Text(output,style: TextStyle(fontSize: outputSize,color: Colors.white.withOpacity(0.7)),),
                SizedBox(height: 30,)

                ],
              ))),
          //button area
          Row(
            children: [
              button(text: "AC",tcolor: Colors.white,),
              button(text: "<",tcolor: Colors.white,),
              button(text: "",tcolor: Colors.white,),
              button(text: "/",tcolor: Colors.orange,),

            ],

          ),
          Row(
            children: [
              button(text: "7",),
              button(text: "8"),
              button(text: "9"),
              button(text: "*",tcolor: Colors.orange,),

            ],

          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-",tcolor: Colors.orange,),

            ],

          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+" , tcolor: Colors.orange,),

            ],

          ),
          Row(
            children: [
              button(text: "%",tcolor: Colors.white,),
              button(text: "0",tcolor: Colors.white),
              button(text: ".",tcolor: Colors.white,),
              button(text: "=",tcolor: Colors.white,buttonColor: Colors.pinkAccent),

            ],

          )
        ],
      ),
    );
  }
  Widget button({
    text,tcolor = Colors.white,buttonColor= buttonColor
  }) {
    return
    Expanded(child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(


            style :ElevatedButton.styleFrom
              (
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                padding: const EdgeInsets.all(8),
                primary:buttonColor ),
            onPressed: ()=> onButtonClick(text), child: Text(text,style: TextStyle(color: tcolor),))));
  }


}
