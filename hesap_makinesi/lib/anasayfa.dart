import 'package:flutter/material.dart';
import 'package:hesap_makinesi/colors.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();

}

class _AnasayfaState extends State<Anasayfa> {
  String girilenSayi = "0";
  double toplam = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Padding(
            padding:  EdgeInsets.all(16.0),
            child: Text(girilenSayi,style: TextStyle(fontSize: 36.0),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonOlustur("C", butonRenk),
              buttonOlustur("+/-", butonRenk),
              buttonOlustur("%", butonRenk),
              buttonOlustur("÷", butonRenk),
          ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonOlustur("7", butonRenk),
              buttonOlustur("8", butonRenk),
              buttonOlustur("9", butonRenk),
              buttonOlustur("X", butonRenk),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonOlustur("4", butonRenk),
              buttonOlustur("5", butonRenk),
              buttonOlustur("6", butonRenk),
              buttonOlustur("-", butonRenk),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonOlustur("1", butonRenk),
              buttonOlustur("2", butonRenk),
              buttonOlustur("3", butonRenk),
              buttonOlustur("+", butonRenk),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width:210,child: buttonOlustur("0", butonRenk)),
              buttonOlustur(".", butonRenk),
              buttonOlustur("=", butonRenk),
            ],
          ),
        ],
      ),
      backgroundColor: appBarColor,
    );
  }


  Widget buttonOlustur(String buttonText, Color buttonRenk) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(backgroundColor: buttonRenk,),
          child: Text(buttonText,style: const TextStyle(fontSize: 24,color: Colors.white),),
        ),
      ),
    );
  }

}



