import 'package:flutter/material.dart';
import 'package:hesap_makinesi/colors.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();

}

class _CalculatorState extends State<Calculator> {
  String girilenSayi = "0";
  double toplam = 0;
  String islem = "";

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
          Text(islem),
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
              Container(child: buttonOlustur("0", butonRenk)),
              buttonOlustur(".", butonRenk),
              buttonOlustur("=", butonRenk),
            ],
          ),
        ],
      ),
      backgroundColor: appBarColor,
    );
  }
  void sayiEkle(String rakam) {
    setState(() {
      if (girilenSayi == "0") {
        girilenSayi = rakam;
      } else {
        girilenSayi += rakam;
      }
    });
  }

  void reset() {
    setState(() {
      girilenSayi = "0";
      toplam = 0;
      islem = "";
    });
  }

  void hesapla() {
    setState(() {
      switch (islem) {
        case "+":
          toplam += double.parse(girilenSayi);
          break;
        default:
          toplam = double.parse(girilenSayi);
      }
      girilenSayi = toplam.toString();
      islem = "";
    });
  }

  void tusaBasildi(String buttonText) {
    switch (buttonText) {
      case "C":
        reset();
        break;
      case "=":
        hesapla();
        break;
      case "+":
      // İşlem butonlarına basıldığında mevcut işlemi güncelle
        toplam = double.parse(girilenSayi);
        girilenSayi = "0";
        break;
      default:
        sayiEkle(buttonText);
        break;
    }
    if(buttonText == "+"){
      setState(() {
        islem = buttonText;
      });
    }
    print('Butona basıldı : $buttonText');
  }




  Widget buttonOlustur(String buttonText, Color buttonRenk) {
    Color arkaplanRenk;
    // Operatör ifadelerine göre arkaplan renklerini ayarla
    switch (buttonText) {
      case "C":
      case "+/-":
      case "%":
      case "÷":
      case "X":
      case "-":
      case "+":
      case "=":
        arkaplanRenk = Colors.orange; // İstediğiniz operatör rengi
        break;
      default:
        arkaplanRenk = buttonRenk; // Diğer durumlarda genel renk
    }
    double buttonWidth = buttonText == "0" ? 170.0 : 72.0;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: (){
          tusaBasildi(buttonText);
        },
            style: ElevatedButton.styleFrom(backgroundColor: arkaplanRenk,minimumSize: Size(buttonWidth , 64),shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
            child: Text(buttonText,style: TextStyle(fontSize: 20,color: Colors.white),)),
      ],
    );
  }

}



