
/*
import 'package:flutter/material.dart';
import 'util/conver_util.dart';
//import 'util/conver_util_1d.dart';

void main() {
  runApp(MaterialApp(
    title: 'Measures Converter',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _numberFrom = 0;
  late String _startMeasure ;
  late String _convertedMeasure ;
  double _result = 0;
  String _resultMessage = '';
  @override
  Widget build(BuildContext context) {
    double sizeX = MediaQuery.of(context).size.width;
    double sizeY = MediaQuery.of(context).size.height;
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );

    final spacer = Padding(padding: EdgeInsets.only(bottom: sizeY/40));
    final List<String> _measures = [
      'meters',
      'kilometers',
      'grams',
      'kilograms',
      'feet',
      'miles',
      'pounds (lbs)',
      'ounces',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Measures Converter'),
      ),
      body: Container(
        width: sizeX,
        padding: EdgeInsets.all(sizeX/20),
        child: SingleChildScrollView(child: Column(
          children: [
            Text('Value', style: labelStyle,),
            spacer,
            TextField(
              style: inputStyle,
              decoration: InputDecoration(
                hintText: "Please insert the measure to be converted",
              ),
              onChanged: (text) {
                setState(() {
                  _numberFrom = double.parse(text);
                });
              },
            ),
            spacer,
            Text('From', style: labelStyle,),
            spacer,
            DropdownButton(
              isExpanded: true,
              style: inputStyle,
              value: _startMeasure,
              items: _measures.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: inputStyle,),
                );
              }).toList(),
              onChanged: (String? value) {
                onStartMeasureChanged(value!);
              },
            ),
            spacer,
            Text('To', style: labelStyle,),
            spacer,
            DropdownButton(
              isExpanded: true,
              style: inputStyle,
              value: _convertedMeasure,
              items: _measures.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: inputStyle,),
                );
              }).toList(),
              onChanged: (String? value) {
                onConvertedMeasureChanged(value!);
              },
            ),
            spacer,
            RaisedButton(child:Text('Convert', style: inputStyle),
              onPressed: ()=>convert(),),
            spacer,
            Text(_resultMessage, style: labelStyle,)
          ],
        )),
      ),
    );
  }

  void onStartMeasureChanged(String value) {
    setState(() {
      _startMeasure = value;
    });
  }
  void onConvertedMeasureChanged(String value) {
    setState(() {
      _convertedMeasure = value;
    });
  }

  void convert() {
    if (_startMeasure.isEmpty || _convertedMeasure.isEmpty || _numberFrom==0) {
      return;
    }
    Conversion c = Conversion();
    double result = c.convert(_numberFrom, _startMeasure, _convertedMeasure);
    setState(() {
      _result = result;
      if (result == 0) {
        _resultMessage = 'This conversion cannot be performed';
      }
      else {
        _resultMessage = '${_numberFrom.toString()} $_startMeasure are ${_result.toString()} $_convertedMeasure';
      }

    });
  }

}*/

/*
//Using StatelessWidget
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
//Using StatelessWidget
class MyApp extends StatelessWidget{
  @override
    Widget build(BuildContext context){
    return MaterialApp(
        title: 'Measures Converter',
        home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Center(
          child: Text('Measures Converter By {<^Golf^>}\nUsing Stateless Widgets'),
        ),
        ),

    );
  }
}*/

//Using StatefulWidget
/*
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
//Using StatefulWidget
class MyApp extends StatefulWidget {
@override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp>{
//class MyAppSate extends State<MyApp>{
  @override
    Widget build(BuildContext context){
    return MaterialApp(
        title: 'Measures Converter',
        home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Center(
          child: Text('Measures Converter By {<^Golf^>}\nUsing Stateful Widgets'),
        ),
        ),
    );
  }
}
*/

//Reading user input from TextField
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
//Using StatefulWidget
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp>{
//class MyAppSate extends State<MyApp>{
//***double _numberFrom;
  late double _numberFrom;
  void initState() {
    _numberFrom = 0;
    super.initState();
  }
  //List of item use in DropDownButton
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  //Convert String into number
  final Map<String, int> _measuresMap = {
    'meters' : 0,
    'kilometers' : 1,
    'grams' : 2,
    'kilograms' : 3,
    'feet' : 4,
    'miles' : 5,
    'pounds (lbs)' : 6,
    'ounces' : 7,
  };

  //Matrix diagram -> Multipliers
  final dynamic _formulars = {
    '0' : [1,0.001,0,0,3.28084,0.000621371,0,0],
    '1' : [1000,1,0,0,3280.84,0.621371,0,0],
    '2' : [0,0,1,0.001,0,0,0.00220462,0.035274],
    '3' : [0,0,1000,1,0,0,2.20462,35.274],
    '4' : [0.3048,0.0003048,0,0,1,0.000189394,0,0],
    '5' : [1609.34,1.60934,0,0,5280,1,0,0],
    '6' : [0,0,453.592,0.453592,0,0,1,16],
    '7' : [0,0,28.3495,0.0283495,3.28084,0,0.0625,1],
  };

  //***String _startMeasure;
  var _startMeasure;
  //***String _convertedMeasure;
  var _convertedMeasure;
  //***String _resultMessage;
  var _resultMessage;

  @override
  Widget build(BuildContext context){

    //double sizeX = MediaQuery.of(context).size.width;
    //double sizeY = MediaQuery.of(context).size.height;

    //Use input TextStyle for TextFields, DropdownButtons and button
    final TextStyle inputStyle = TextStyle(
          fontSize: 20,
          color: Colors.blue[900],
    );

    //Use input labelStyle for Text Widget in the column
    final TextStyle labelStyle = TextStyle(
          fontSize: 24,
        color: Colors.grey[700],
    );

    //final spacer = Padding(padding: EdgeInsets.only(bottom: sizeY/40));



    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter By {<^Golf^>}'),
          backgroundColor: Colors.purple,
        ),
        //body: Center( for center of screen

        //adjust distance of column
        body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
          //Solve bigger than screen by use SingleChileScrollView
          //child: SingleChildScrollView(
          child: Column(


          //child: Text('Measures Converter By {<^Golf^>}\nUsing Stateful Widgets'),
          children: [
            //Use Spacer for set spacing between widget
            Spacer(),
            Text(
              'Value',
              style: labelStyle,
            ),
            Spacer(),

          /*
            //Use Dropdownbutton widget
            DropdownButton(
              items: _measures.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),);
              }).toList(),
              //onChanged: (_) {}, This code will show noting in dropdown
              //follow code will show selected item in dropdown
              onChanged: (value) {
                setState(() {
                    _startMeasure = value;
                });
              },
              value: _startMeasure,
            ),*/


            TextField(
            //use textStyle
            style: inputStyle,
              //use decoration property
              decoration: InputDecoration(
                hintText: "Please insert the measure to be converted",
              ),

            //When user input value then show on screen
            onChanged: (text){
              var rv = double.tryParse(text);
              if (rv != null){
                      setState(() {
                        _numberFrom = rv;
                      });
              }
            },
          ),

            //Text((_numberFrom == null) ? '' : _numberFrom.toString())

            //Use Spacer for set spacing between widget
            Spacer(),
            Text('From',style: labelStyle,),
            Spacer(),
            //Use DropdownButton
            DropdownButton(
              isExpanded: true,
              style: inputStyle,
              items: _measures.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: inputStyle,),
                );
              }).toList(),
              onChanged: (value){
                  setState(() {
                    _startMeasure = value;
                  });
              },
              value: _startMeasure,
            ),

            Spacer(),
            Text('To',style: labelStyle,),
            Spacer(),

            DropdownButton(
              isExpanded: true,
              style: inputStyle,
              items: _measures.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: inputStyle,
                  ),
                );
              }).toList(),
              onChanged: (value){
                setState(() {
                  _convertedMeasure = value;
                });
              },
                  value: _convertedMeasure,
            ),

            Spacer(flex: 2,),
              RaisedButton(
                child: Text('Convert', style: inputStyle),
                //onPressed: () => true,
                onPressed: () {
                  if (_startMeasure.isEmpty || _convertedMeasure.isEmpty || _numberFrom==0){
                    return;
                  }else{
                    convert(_numberFrom, _startMeasure, _convertedMeasure);
                  }
                },
              ),
            Spacer(flex: 2,),
            /*
            Text((_numberFrom == null) ? '' : _numberFrom.toString(),
               style: labelStyle),*/

            Text((_resultMessage == null) ? '' : _resultMessage,
                style: labelStyle),
            Spacer(flex: 8,),

          ],
         ),
        //),
      ),
    ),
    );
  }
  void convert(double value, String from, String to){
    //***int nFrom = _measuresMap[from];
    //***int nTo = _measuresMap[to];
    int? nFrom = _measuresMap[from];
    int? nTo = _measuresMap[to];
      var multiplier = _formulars[nFrom.toString()][nTo];
      var result = value * multiplier;

      if (result == 0){
          _resultMessage = 'This conversion can not be performed';
      }else
        {
          _resultMessage = '${_numberFrom.toString()} $_startMeasure '
                            'are ${result.toString()} $_convertedMeasure';
        }
      setState(() {
        _resultMessage = _resultMessage;
      });
  }
}

