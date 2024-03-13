import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

bool checkEmail(String email){
  return RegExp(r"^[0-9a-z]+@[0-9a-z]+\.\w{2,}$").hasMatch(email);
}

void showErrorDialog(BuildContext context, String error) {
  showDialog(context: context,
      builder: (_) => AlertDialog(
            title: Text("Ошибка"),
            content: Text(error),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          ));
}


Future<bool> checkNetworkConnection() async {
  var connectivityResult = Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

Future<void> request<T>({

  required Function request,
  required Function(T) onResponse,
  required Function(String) onError
}
    ) async {
  try{
    if (! await checkNetworkConnection()){
      dynamic result = await request();
      onResponse(result);
    }
  } on AuthException catch(e){
    onError(e.message);
  } on PostgrestException catch(e){
    onError(e.message);
  } on Exception catch(e){
    onError(e.toString());
  }

}
