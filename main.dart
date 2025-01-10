import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Your BMI' ,style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w800
        ),),
      ),
      body:Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('BMI CALCULATOR',style: TextStyle(
                  fontSize: 24, fontWeight:FontWeight.w700
                ),),

                SizedBox(height:21),
                TextField(
                  controller:wtController ,
                  decoration: InputDecoration(
                    label: Text('Enter your weight (in Kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                TextField(
                  controller:ftController ,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in Feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),
                TextField(
                  controller:inController ,
                  decoration: InputDecoration(
                    label: Text('Enter your Height(in inch)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                      var ft =ftController.text.toString();
                     var inch = inController.text.toString();
                  if(wt!= ""&& ft!= ""&& inch!=""){
                     var iWt =int.parse(wt);
                     var iFt = int.parse(ft);
                     var iInch = int.parse(inch);
                     var tInch =(iFt*12)+iInch;
                     var tCm = tInch*2.54;
                     var tM =tCm/100;
                     var bmi = iWt/(tM*tM);
                     setState(() {
                       result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
                     });


                  } else {
                      setState(() {
                        result = "please fill all the requird blanks!!";
                      });
                  }

                  },


                    child: Text('BMI')),
                SizedBox(height: 11,),
                Text(result,style:TextStyle(fontSize:16, ))


              ],
            ),
          ),
        ),
      )

    );
  }
}

