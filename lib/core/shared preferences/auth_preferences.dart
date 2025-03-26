import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _firstName = 'first_name';
  static const String _lastName = 'last_name';
  static const String _userEmailKey = 'user_email';
  static const String _rememberMeKey = 'remember_me';

  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, value);
  }

  // التحقق من حالة تسجيل الدخول
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // حفظ معرف المستخدم
  static Future<void> setFirstName(String firstName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_firstName, firstName);
  }

  // الحصول على معرف المستخدم
  static Future<String?> getFirstName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_firstName);
  }

  static Future<void> setLastName(String lastName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastName, lastName);
  }

  // الحصول على معرف المستخدم
  static Future<String?> getLastName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastName);
  }

  // حفظ البريد الإلكتروني
  static Future<void> setUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmailKey, email);
  }

  // الحصول على البريد الإلكتروني
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  // حفظ تفضيل "تذكرني"
  static Future<void> setRememberMe(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_rememberMeKey, value);
  }

  // التحقق من تفضيل "تذكرني"
  static Future<bool> shouldRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_rememberMeKey) ?? false;
  }

  // مسح جميع بيانات المصادقة
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isLoggedInKey);
    await prefs.remove(_firstName);
    await prefs.remove(_lastName);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_rememberMeKey);
  }

  // تهيئة أولية للبيانات
  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    // يمكنك إضافة أي تهيئة أولية هنا إذا لزم الأمر
  }
}
