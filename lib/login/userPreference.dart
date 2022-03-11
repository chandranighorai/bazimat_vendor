import 'package:shared_preferences/shared_preferences.dart';

saveUserPref(String token, String zone, String email, String id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("token", token);
  pref.setString("zone", zone);
  pref.setString("email", email);
  pref.setString("id", id);
}
