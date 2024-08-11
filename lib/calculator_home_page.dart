import'package:flutter/material.dart';

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String output='0';
  double num1=0;
  double num2=0;
  String operator='';

  void clear(){
    output='0';
    num1=0;
    num2=0;
    operator=' ';
  }

  void buttonPressed(String buttonText){
    if(buttonText=='C'){
      clear();
    }
    else if(buttonText=='+'||buttonText=='-'||buttonText=='/'||buttonText=='X'){
      operator=buttonText;
      num1=double.parse(output);
      output='0';
    }
    else if(buttonText=='='){
      num2=double.parse(output);
      calculate();
    }
    else{
      output=output =='0'?buttonText:output+buttonText;
    }
    setState(() {
      
    });
  }
   void calculate(){
    double outputs=0;
    if(operator=='+'){
      outputs=num1+num2;
    
    }
    else if(operator=='-'){
      outputs=num1-num2;
    }
    else if(operator=='/'){
      if(num2!=0){
         outputs=num1/num2;
      }
      else{
        output='error';
        return;
      }
    }
    output=outputs.toString();
    num1=outputs;
    num2=0;
    operator='0';
   }

   
  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        leading:IconButton(onPressed:(){},
         icon:Icon(Icons.menu_sharp,size:20,)),
         title:Text('Calculator',
         style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.teal[300]
         ),),
         centerTitle: true,
      ),
      body: Column(
        children: [
         Expanded(
           child: Container(
           alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            child:Text(output,
            style:TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),) ,
           ),
         ),
          
         Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('x'),
            ],
          ),
          Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            children: [
              _buildButton('0'),
              _buildButton('C'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
   
        ],
      ),
    );
  }
}