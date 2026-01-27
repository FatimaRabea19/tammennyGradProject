import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // نحتاجها للتحكم في نوع لوحة المفاتيح
import 'forget_password.dart';
import 'set_new_password.dart';

// --- Theme Colors (Based on previous screens for consistency) ---
const Color kPrimaryDarkColor = Color(0xFF456882); // لون الأزرار والعناوين الداكنة
const Color kBackgroundColor = Color(0xFFF9F3EF); // لون الخلفية الكريمي الفاتح
const Color kLightAccentColor = Color(0xFFE0D8D0); // لون الدائرة الفاتحة في الخلفية
const Color kMediumAccentColor = Color(0xFFC0B3A6); // لون الدائرة الوسطى في الخلفية

// --- Main Screen ---
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // شريط علوي بسيط مع زر العودة
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryDarkColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()),
            );
          },
        ),
        title: const Text(
          'Verify Your Email',
          style: TextStyle(
            color: kPrimaryDarkColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),

            // منطقة الأيقونة الدائرية
            const _CircleIconBackground(),

            const SizedBox(height: 50),

            // رسالة التوضيح
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Please Enter The 4 Digits Code Sent To Emailname@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryDarkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // حقول إدخال الـ OTP
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _OtpInput(isFirst: true, isLast: false),
                  _OtpInput(isFirst: false, isLast: false),
                  _OtpInput(isFirst: false, isLast: false),
                  _OtpInput(isFirst: false, isLast: true),
                ],
              ),
            ),

            const SizedBox(height: 60),

            // زر التأكيد
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// --- Custom Widget for the Circular Icon Background ---
class _CircleIconBackground extends StatelessWidget {
  const _CircleIconBackground();

  @override
  Widget build(BuildContext context) {
    // حجم الدائرة الكبيرة
    const double outerSize = 160.0;
    // حجم الدائرة الوسطى
    const double mediumSize = 120.0;

    return Center(
      child: Container(
        width: outerSize,
        height: outerSize,
        decoration: BoxDecoration(
          color: kLightAccentColor, // اللون الخارجي الفاتح
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: mediumSize,
            height: mediumSize,
            decoration: const BoxDecoration(
              color: Color(0xFF758CA0), // اللون الداخلي (أزرق رمادي)
              shape: BoxShape.circle,
            ),
            // لا توجد أيقونة قفل هنا، فقط اللون الدائري كما في التصميم
          ),
        ),
      ),
    );
  }
}

// --- Custom Widget for a Single OTP Input Field ---
class _OtpInput extends StatelessWidget {
  final bool isFirst;
  final bool isLast;

  const _OtpInput({required this.isFirst, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: isFirst, // يبدأ التركيز على الحقل الأول
        onChanged: (value) {
          if (value.length == 1 && !isLast) {
            FocusScope.of(context).nextFocus(); // ينتقل للحقل التالي
          }
          if (value.isEmpty && !isFirst) {
            FocusScope.of(context).previousFocus(); // ينتقل للحقل السابق عند الحذف
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: kPrimaryDarkColor,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(

          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kMediumAccentColor, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryDarkColor, width: 3),
          ),
          counterText: "", //  (0/1)
        ),
      ),
    );
  }
}