//import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp( Mycalculator());
}
class Mycalculator extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "",
      home: calculator()
    ) ;
  }

}
class calculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _calculator();
  }

}
 class _calculator extends State<calculator>{
  String text='0';
 double numOne=0;
 double numtwo=0;
 String result='0';
 String finalres='0';
 String oper='';
 String peroper='';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: null,
     backgroundColor: Colors.black,
     body: Container(
       margin: EdgeInsets.only(bottom: 20),
       child: Column(
         mainAxisAlignment:MainAxisAlignment.end,
         children: <Widget>[

           Row(
             children: <Widget>[
               Expanded(
                   child: Text(
                     text,
                     style: TextStyle(
                       color: Colors.white,
                          fontSize:60
                     ),
                     maxLines:1,
                     textAlign: TextAlign.right,
                   ),
               )
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("C", Color(0xffa5a5a5),1),
               button("+/-", Color(0xffa5a5a5),1),
               button("%", Color.fromRGBO(165, 165, 165, 1),1),
               button( "/", Color(0xffff9800),1),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("7", Color(0xff4E4C4C),1),
               button("8", Color(0xff4E4C4C),1),
               button("9", Color(0xff4E4C4C),1),
               button( "*", Color(0xffff9800),1),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("4", Color(0xff4E4C4C),1),
               button("5", Color(0xff4E4C4C),1),
               button("6", Color(0xff4E4C4C),1),
               button( "-", Color(0xffff9800),1),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("1", Color(0xff4E4C4C),1),
               button("2", Color(0xff4E4C4C),1),
               button("3", Color(0xff4E4C4C),1),
               button( "+",Color(0xffff9800),1),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("0", Color(0xff4E4C4C),0),
               button(".", Color(0xff4E4C4C),1),
               button("=", Color(0xffff9800),1),

             ],
           )
         ],
       ),
     ),
   );
  }
  Widget button(String btntxt,Color color,int num) {
Container container;
if(num==0){
  container=Container(
    padding: EdgeInsets.only(bottom: 10),
    child: RaisedButton(
      onPressed: (){
        calculate(btntxt);
      },
      child: Text(btntxt,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      color: color,
      padding: EdgeInsets.only(left:81,top: 20,right: 81,bottom: 20),
      shape: StadiumBorder(),
    ),
  );
}else{
  container=Container(
    padding: EdgeInsets.only(bottom: 10),
    child: RaisedButton(
      onPressed: (){
calculate(btntxt);
      },
      child: Text(btntxt,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      color: color,
      padding: EdgeInsets.all(20),
      shape: CircleBorder(),
    ),
  );
};
    return container;
  }
  void calculate(txtBtn){
    if(txtBtn=='C'){
      text='0';
      numOne=0;
      numtwo=0;
      result='';
      finalres='0';
      oper='';
      peroper= '';
    }else if(oper=='=' &&txtBtn=='=')
      {
        switch(peroper){
          case '+':
            finalres =add();
            break;
          case '-':
            finalres =sub();
            break;
          case '*':
            finalres =mul();
            break;
          case '/':
            finalres =div();
            break;
        }
      }

    else if(txtBtn=='+'||txtBtn=='-'||txtBtn=='*'||txtBtn=='/'||txtBtn=='='){
      if(numOne==0)
        {
          numOne=double.parse(result);
        }else{
        numtwo=double.parse(result);
      }
      switch(oper){
        case'+':
          finalres=add();
          break;
        case'-':
          finalres=sub();
          break;
        case'*':
          finalres=mul();
          break;
          case'/':
            finalres=div();
        break;

      }
      peroper=oper;
      oper=txtBtn;
      result='';
    }else if(txtBtn=='%'){
      result=(numOne/100).toString();
      finalres=result;
    }
    else if(txtBtn=='.'){
      if(!result.contains('.'))
        {
          result+='.';
        }
      finalres=result;
    }
    else if(txtBtn=='+/-'){
      result.startsWith('-')? result=result.substring(1) : result='-'+result;
    finalres=result;
    }
    else{
      if(result=='0'){
        result=txtBtn;
      }
      else{
      result+=txtBtn;
      finalres=result;
    }
    }
    setState(() {
      text=finalres;
    });
  }
  String add(){
    result=(numOne+numtwo).toString();
    numOne=double.parse(result);
    return decimalRemovw(result);
  }
  String sub(){
    result=(numOne-numtwo).toString();
    numOne=double.parse(result);
    return decimalRemovw(result);
  }
  String mul(){
    result=(numOne*numtwo).toString();
    numOne=double.parse(result);
    return decimalRemovw(result);
  }
  String div(){
    result=(numOne/numtwo).toString();
    numOne=double.parse(result);
    return decimalRemovw(result);
  }
  String decimalRemovw(String res){
    if(res.contains('.')){
      List<String> sol=res.split('.');
      if(!(int.parse(sol[1])>0))
        {
          return sol[0];
        }

    }
    return res;
  }
 }
