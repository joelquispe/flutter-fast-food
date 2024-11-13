import 'package:flutter/material.dart';

class CardInformationProvider extends ChangeNotifier{
    String cardHolderFullName = "";
    String cardTextNumber = "";
    String cardTextExp = "";
    String cardTextCvv = "";

    void setCardHolderFullName(String value){
      cardHolderFullName = value;
      notifyListeners();
    }

    void setCardTextNumber(String value){
      cardTextNumber = value;
      notifyListeners();
    }

    void setCardTextExp(String value){
      cardTextExp = value;
      notifyListeners();
    }

    void setCardTextCvv(String value){
      cardTextCvv = value;
      notifyListeners();
    }
}