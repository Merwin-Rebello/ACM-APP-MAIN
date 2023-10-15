



import 'package:flutter/Material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:acm_app/workingwithgsheet.dart';
class userAPI{
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "acm-app-c81bd",
  "private_key_id": "712515087af66411acbee488ae2aaf122975a14e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC2O2wYc/moj5Dz\nsxxRVdwEu4xK5/yHJPpt3MSgZ0jD31eWjvPvHdsYucnB25771nTfJK1JShGNwbWb\nMLGeVh9vdmhiypOSrt7LccpbI4rdCY5ai/C1ccPr3yLBCbMOoNjbpqx08+khgJFz\nHHtAv1Ahzf7yyDEaVTI8c26F/ubPzZkc7fzCsjWpa/RhppxtxgY8xHAPiOekcYM5\n7IlDjAxO969J7z0Kp50HYRGARhXELiPsYSm86ho0sUN+JQ+8MUaClmXhwagAyaHK\nMt7hok6dFhd6HRkjk9Gek/h8uCi6Cj583xHqF0fgBIfWSlUPf4QCB1792WVmg/uo\nwcBqGVPZAgMBAAECggEAF4APPxIJspqdC0hgUP7dCkEzZN+I2dbDctKDCtp28EeH\nkJNr0rzLaeNfqN/NH1X3KWWd8TMbk2fVJye+6BfcIvAmowLTyBlEAwFwIpOxTzLx\nyCx+xK9goDTc0v8Qt8S3YpAaclSYDml5mFombOGfEFTz2VRGvMoa2d/a8229TzPQ\nyZbbaIbWsO6UaHl4h8yW3ZUnpH9vffjL8g3qshqF+z0WyOEN8ZXEEgM+7M+Wl8jh\noA/AftoD3BtMBdgQMFm5xf5Uw8FYdKnHBnqu2JoTOaAfq82ybJimiBMnFVwLdPnA\nNfdc+JPSGtWCXaYPeG0LEIXK8MpPPA8gtdP/3VfEPwKBgQDxnN5yrn5tnT6zmIll\n9YslAoilD9BVgySVX3TgWFt+iA2nRNpRwxgOZ6zd+lOAdm+LAHU0nNQvZn40xOya\ngPBHoSsA6foYB3QYwih1DJkxyrbHshq4VxoP3E11i8V7mjQW/ncwYDbxsIgz6irF\npWpnGH5PL5a5udFvKhDe8yPJ+wKBgQDBFVussHagPNhqDgNzWGf+Eu5ZOSY84V0b\nUuvz21NyJOdGMSjDwumTYtscfFCXtzOcuYmG4UcpwrMPqINCYFjgPC6Ic1ih3DfI\nyPwXX3NJNNYKlbsohnjYIwCkRoeioMq+h9qrLyHhNs//zQhHQ0uLk5cpvzqRMIaa\ns9RI0hGlOwKBgQDdeemjgHaeLlUqtjnEv8dz/pWZkRxtNpDTaDQv7m64VykE2qWx\n6z9i/QBGXtAqYuauqZXGy7fpV297GcS1gFpBnuhXpyM84aA3jcseOJU5QlQ4S/gY\nYKegQFa02JIHUnxLU6mYK6pR9Ht180KP+KjHpnkqRzpIN6BW4V2jsYdt/wKBgQCZ\nBLYse4TnpJDWK9jsNqnjn1kpeLMnGGtTVjoMfkr5cOmgpSDrU7MMzRFc1+B++/95\nO0kUjcB6BgUmaaPsnLKSst8l4FPjosTK6Q1v8INLBwaCSPuUOE3Y7JR7nDGt3sQO\nj1fqxmWROIFK9lCTOW/LY+IugZCGs/BY9h9Mvr6hNQKBgQDS9hQ1cBAusNVbetNd\nMXsIP3Q1wJaS0NOVkC4rKq6KvKeM8u/uO8SZDiWudePGFjS+W9OK6C/zebOIz2TC\nCxXPcXJaA7vXR7kunBVh4p6rpVL7xPh6Dh1M+NJjSK3jk/jp6zz/fezyIR9o8aKN\nqeQmge4ryOU9o2aAI4NxOdJ9Jw==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@acm-app-c81bd.iam.gserviceaccount.com",
  "client_id": "112280752325533528586",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40acm-app-c81bd.iam.gserviceaccount.com"
}
  
  ''';
  static final _sid = '1LJGYdAdvDNJXiEVrpAT5rvZuDoQDG6rnidrCK5aLCbo';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _usersheet;
  static Spreadsheet? _spreadsheet;
  static int rowCount=1;

  static Future init() async{
     _spreadsheet = await _gsheets.spreadsheet(_sid);
    _usersheet = await  _getWorksheet(_spreadsheet!, title:'Sheet2');


    //final firstRow = wwgsheets.getfields();
    // try {
    //   _usersheet!.values.insertRow(1, firstRow);
    // }
    // catch(e){
    //   print(e);
    // }
  }

  static Future<Worksheet> _getWorksheet(Spreadsheet spreadsheet, {required String title}) async{
    try{

      return await spreadsheet.addWorksheet(title);

    }
    catch(e){

      return spreadsheet.worksheetByTitle(title)!;
    }
  }
  static Future insert(List x,String worksheet) async{
    _usersheet = await _getWorksheet(_spreadsheet!, title: worksheet);
    try {
      _usersheet!.values.insertRow(1,["Name","year","RollNo"]);
      _usersheet!.values.appendRow(x);


    }
    catch(e){
      print(e);
    }
  }
}

