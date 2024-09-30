// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

List klanguagesData = [
  {
    "ID": 0,
    "LanguagesNameEng": "Hindi",
    "LanguagesNameNative": "हिंदी",
    "LanguagesDescription":
        "हिंदी अनुवाद केवल सुविधा के लिए दिया गया है. किसी भी विवाद की स्थिति में वेबसाइट के अंग्रेजी संस्करण को प्राथमिकता दी जाएगी.",
    "ImageActive": "assets/Languages/H2.png",
    "ImagedeActive": "assets/Languages/H1.png",
    "CurrentStatus": false,
    "Top": "भाषा चुनें",
    "bottom": "जारी रखना"
  },
  {
    "ID": 1,
    "LanguagesNameEng": "Punjabi",
    "LanguagesNameNative": "ਪੰਜਾਬੀ",
    "LanguagesDescription":
        "ਹਿੰਦੀ ਅਨੁਵਾਦ ਸਿਰਫ਼ ਸਹੂਲਤ ਲਈ ਦਿੱਤਾ ਗਿਆ ਹੈ. ਕਿਸੇ ਵੀ ਵਿਵਾਦ ਦੀ ਸਥਿਤੀ ਵਿੱਚ, ਵੈਬਸਾਈਟ ਦੇ ਅੰਗਰੇਜ਼ੀ ਸੰਸਕਰਣ ਨੂੰ ਤਰਜੀਹ ਦਿੱਤੀ ਜਾਵੇਗੀ.",
    "ImageActive": "assets/Languages/P2.jpg",
    "ImagedeActive": "assets/Languages/P1.jpg",
    "CurrentStatus": false,
    "Top": "भाषा चुनें",
    "bottom": "जारी रखना"
  },
  {
    "ID": 2,
    "LanguagesNameEng": "Assamese",
    "LanguagesNameNative": "ਅਸਾਮੀ",
    "LanguagesDescription":
        "হিন্দী অনুবাদ কেৱল সুবিধাৰ বাবে দিয়া হৈছে। কোনো বিবাদ হ’লে ৱেবছাইটৰ ইংৰাজী সংস্কৰণে অগ্ৰাধিকাৰ লাভ কৰিব.",
    "ImageActive": "assets/Languages/A2.jpg",
    "ImagedeActive": "assets/Languages/A1.jpg",
    "CurrentStatus": false,
    "Top": "ভাষা বাছি লওক",
    "bottom": "অব্যাহত ৰাখক"
  },
  {
    "ID": 3,
    "LanguagesNameEng": "English",
    "LanguagesNameNative": "English",
    "LanguagesDescription": "",
    "ImageActive": "assets/Languages/E2.jpg",
    "ImagedeActive": "assets/Languages/E1.jpg",
    "CurrentStatus": false,
    "Top": "Choose Language",
    "bottom": "CONTINUE"
  },
  {
    "ID": 4,
    "LanguagesNameEng": "Tamil",
    "LanguagesNameNative": "தமிழ்",
    "LanguagesDescription":
        "தமிழ் மொழிபெயர்ப்பு வசதிக்காக மட்டுமே வழங்கப்படுகிறது. சர்ச்சை ஏற்பட்டால், இணையதளத்தின் ஆங்கிலப் பதிப்பு முன்னுரிமை பெறும்.",
    "ImageActive": "assets/Languages/TA2.jpg",
    "ImagedeActive": "assets/Languages/TA1.jpg",
    "CurrentStatus": false,
    "Top": "மொழியை தேர்வு செய்யவும்",
    "bottom": "தொடரவும்"
  },
  {
    "ID": 5,
    "LanguagesNameEng": "Telugu",
    "LanguagesNameNative": "తెలుగు",
    "LanguagesDescription":
        "హిందీ అనువాదం సౌలభ్యం కోసం మాత్రమే అందించబడింది. వివాదం ఏర్పడిన సందర్భంలో, వెబ్‌సైట్ యొక్క ఆంగ్ల వెర్షన్ ప్రాధాన్యతనిస్తుంది.",
    "ImageActive": "assets/Languages/T2.jpg",
    "ImagedeActive": "assets/Languages/T1.jpg",
    "CurrentStatus": false,
    "Top": "భాషను ఎంచుకోండి",
    "bottom": "కొనసాగుతుంది"
  },
  {
    "ID": 6,
    "LanguagesNameEng": "Bengali",
    "LanguagesNameNative": "বাংলা",
    "LanguagesDescription":
        "হিন্দি অনুবাদ শুধুমাত্র সুবিধার জন্য প্রদান করা হয়. বিবাদের ক্ষেত্রে, ওয়েবসাইটের ইংরেজি সংস্করণ প্রাধান্য পাবে.",
    "ImageActive": "assets/Languages/B2.jpg",
    "ImagedeActive": "assets/Languages/B1.jpg",
    "CurrentStatus": false,
    "Top": "ভাষা নির্বাচন করুন",
    "bottom": "চালিয়ে যান"
  },
  {
    "ID": 7,
    "LanguagesNameEng": "Marathi",
    "LanguagesNameNative": "मराठी",
    "LanguagesDescription":
        "हिंदी भाषांतर फक्त सोयीसाठी दिलेले आहे. विवादाच्या बाबतीत, वेबसाइटची इंग्रजी आवृत्ती प्रबल होईल.",
    "ImageActive": "assets/Languages/MA2.jpg",
    "ImagedeActive": "assets/Languages/MA1.jpg",
    "CurrentStatus": false,
    "Top": "भाषा निवडा",
    "bottom": "सुरू"
  },
  {
    "ID": 8,
    "LanguagesNameEng": "Odia",
    "LanguagesNameNative": "ଓଡିଆ",
    "LanguagesDescription":
        "କେବଳ ସୁବିଧା ପାଇଁ ହିନ୍ଦୀ ଅନୁବାଦ ପ୍ରଦାନ କରାଯାଇଛି  ବିବାଦ ହେଲେ ୱେବସାଇଟର ଇଂରାଜୀ ସଂସ୍କରଣ ପ୍ରାଧାନ୍ୟ ଦେବ ",
    "ImageActive": "assets/Languages/O2.jpg",
    "ImagedeActive": "assets/Languages/O1.jpg",
    "CurrentStatus": false,
    "Top": "ଭାଷା ବାଛନ୍ତୁ ",
    "bottom": "ଜାରିରଖ"
  },
  {
    "ID": 9,
    "LanguagesNameEng": "Malayalam",
    "LanguagesNameNative": "മലയാളം",
    "LanguagesDescription":
        "ഹിന്ദി വിവർത്തനം സൗകര്യാർത്ഥം മാത്രമാണ് നൽകിയിരിക്കുന്നത്. തർക്കമുണ്ടായാൽ, വെബ്‌സൈറ്റിൻ്റെ ഇംഗ്ലീഷ് പതിപ്പ് നിലനിൽക്കും.",
    "ImageActive": "assets/Languages/M2.jpg",
    "ImagedeActive": "assets/Languages/M1.jpg",
    "CurrentStatus": false,
    "Top": "ഭാഷ തിരഞ്ഞെടുക്കുക",
    "bottom": "തുടരുക"
  },
  {
    "ID": 10,
    "LanguagesNameEng": "Gujarathi",
    "LanguagesNameNative": "ગુજરાતી",
    "LanguagesDescription":
        "હિન્દી ભાષાંતર માત્ર સગવડ માટે આપવામાં આવ્યું છે. વિવાદના કિસ્સામાં, વેબસાઇટનું અંગ્રેજી સંસ્કરણ પ્રચલિત રહેશે.",
    "ImageActive": "assets/Languages/G2.jpg",
    "ImagedeActive": "assets/Languages/G1.jpg",
    "CurrentStatus": false,
    "Top": "ભાષા પસંદ કરો",
    "bottom": "ચાલુ રાખો"
  },
];

// image
String gitImageLink =
    "https://raw.githubusercontent.com/RAJASURYA2002/Flipkartimages/main/images/";
List<Widget> imageList = [
  Image.network(
    "${gitImageLink}slid-1.webp",
  ),
  Image.network(
    "${gitImageLink}slid-2.webp",
  ),
  Image.network(
    "${gitImageLink}slid-3.webp",
  ),
  Image.network(
    "${gitImageLink}slid-4.webp",
  ),
  Image.network(
    "${gitImageLink}slid-5.webp",
  ),
];
