import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  void toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }
}