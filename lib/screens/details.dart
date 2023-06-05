import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50)
              )
            ),
            child: Column(children: [
              const SizedBox(height: 50),
              ListTile(
                title: Text('Bus Details', style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
              ),
            ]),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 35),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children:[
                  itemDashboard('Bus No:1', 'Thrissur-Mannuthy'),
                  itemDashboard('Bus No:2', 'Thrissur-Olari'),
                  itemDashboard('Bus No:3', 'Triprayar-Kanjany'),
                  itemDashboard('Bus No:5', 'Amballur-Varandarappilly'),
                  itemDashboard('Bus No:6', 'Chalakudy-Koratty'),
                  itemDashboard('Bus No:7', 'Mala-Valiaparamb'),
                  itemDashboard('Bus No:8', 'Thrissur-Pukunnam'),
                  itemDashboard('Bus No:9', 'Kodungallor-paravoor')
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
  itemDashboard(String title,String text,) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme.of(context).primaryColor.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 5
        )
      ]
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      
      const SizedBox(height: 8),
      Text(title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
      Text(text, style: TextStyle(fontSize: 18))
    ],),
  );
}
