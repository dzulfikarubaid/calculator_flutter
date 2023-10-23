
import 'package:flutter/material.dart';
import 'package:flutter_calculator/providers/cal_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/textfield.dart';

Future<String> getStringFromLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('result') ?? '';
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Consumer<CalculatorProvider>(
      builder: (context, provider, _) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: 
            Column(
              children: [
                Padding(
                padding: const EdgeInsets.only(top: 60, right: 20),  // Sesuaikan left dengan nilai yang diinginkan
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    provider.result,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: CustomTextField(
                    controller: provider.compController),
                    
                ),
                const Spacer(),
                Container(
                  height: screenHeight * 0.7,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                  [Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => buttons[index])),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => buttons[index+4]))
                    ,
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => buttons[index+8]))
                    ,
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => buttons[index+12])),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => buttons[index+16])),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => buttons[index+20])),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => buttons[index+24])),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => buttons[index+28])),
                    
                   
              
                  ]),
                ),
                ]
            )
            );
      }
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key, required this.name, this.textColor = Colors.white, this.fontSize = 40
  });
  final String name;
  final Color? textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
  return InkWell(
    onTap: () =>
        Provider.of<CalculatorProvider>(context, listen: false).setValue(name),
    child: Material(
      elevation: 3,
      color: name == "=" ? Colors.blue[900] : Colors.grey[900],
      borderRadius: BorderRadius.circular(50),
      child: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.transparent, // Sesuaikan sesuai kebutuhan Anda
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      ),
    ),
  );
}

}
List<Widget> buttons = [
  Button(name: 'AC', textColor: Colors.blue[600], fontSize: 26,),
  Button(name: 'e', textColor: Colors.white, fontSize:36),
  Button(name: 'DEL', textColor: Colors.blue[600], fontSize: 26,),
  Button(name: '÷', textColor: Colors.blue[600],),
  Button(name: '1', textColor: Colors.white),
  Button(name: '2', textColor: Colors.white),
  Button(name: '3', textColor: Colors.white),
  Button(name: '×', textColor: Colors.blue[600], ),
  Button(name: '4', textColor: Colors.white),
  Button(name: '5', textColor: Colors.white),
  Button(name: '6', textColor: Colors.white),
  Button(name: '+', textColor: Colors.blue[600], ),
  Button(name: '7', textColor: Colors.white),
  Button(name: '8', textColor: Colors.white),
  Button(name: '9', textColor: Colors.white),
  Button(name: '-', textColor: Colors.blue[600], ),
  Button(name: '%', ),
  Button(name: '0', textColor: Colors.white),
  Button(name: '.', ),
  Button(name: '=', ),
  Button(name: '^', fontSize: 26,),
  Button(name: '√', fontSize: 26),
  Button(name: '(',  fontSize: 26),
  Button(name: ')',  fontSize: 26,),
  
  Button(name: 'sin', textColor: Colors.white, fontSize:26),
  Button(name: 'cos', textColor: Colors.white, fontSize:26),
  Button(name: 'tan', textColor: Colors.white, fontSize:26),
  Button(name: 'ans', textColor: Colors.white, fontSize:26),
  Button(name: 'π', fontSize: 26),

  Button(name: 'log',  fontSize: 26),
  Button(name: 'ln',  fontSize: 26,),
  Button(name: '!', fontSize: 26),
  
  
];