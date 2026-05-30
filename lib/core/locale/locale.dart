// ignore_for_file: equal_keys_in_map

import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {
      "skip": "تخطي",

      "bodySplash1":
          "اكتشف أفضل عروض الدراجات الكهربائية الجديدة والمستعملة، بالإضافة إلى جميع الإكسسوارات التي تحتاجها لتجربة قيادة مريحة وآمنة. اختر دراجتك اليوم واستمتع بالحرية على الطريق!",
      "titleSplash2":
          "انطلق مع Doctor Bike وحقق أقصى استفادة من التنقل الكهربائي!",
      "bodySplash2":
          "سواء كنت تبحث عن دراجة جديدة أو مستعملة، أو تحتاج إلى إكسسوارات رائعة، نحن هنا لتقديم كل ما تحتاجه لتجربة قيادة رائعة",
      "titleSplash3": "هل أنت مستعد للانطلاق؟",
      "bodySplash3":
          "استمتع بتجربة شراء مميزة مع [اسم التطبيق]! اختر من بين أرقى الدراجات الكهربائية الجديدة والمستعملة، بالإضافة إلى ملحقات تضيف قيمة لكل رحلة",
      'Select your language': "أختر اللغة",
      //auth
      "intro": "مرحبًا بك في",
      "nameApp": "Doctor Bike",
      "intro2": "مرحبا بك في تطبيق Doctor Bike",
      "createAccount": "إنشاء حساب",
      "logIn": "تسجيل الدخول",
      "Or": "أو",
      "LoginWith": "تسجيل الدخول بواسطة",
      "welcomeBack": "مرحبًا بعودتك!",
      "welcome": "مرحبًا",
      "email": "البريد الإلكتروني",
      "phoneNumber": "رقم الهاتف",
      "FullName": "الاسم بالكامل",
      "password": "كلمة المرور",
      "Remember me": "تذكرني",
      "forgetPassword": "هل نسيت كلمة السر؟",
      "Don't have an account": "ليس لديك حساب؟ ",
      "subscription": "اشتراك",
      "ConfirmPassword": "تأكيد كلمة المرور",
      "SubscribeNow": "أشترك الان",
      "Already have an account": "لديك حساب بالفعل؟ ",
      "createAccount successfully": "تم إنشاء الحساب بنجاح",
      "Login successfully": "تم تسجيل الدخول بنجاح",
      "Wrong email or password": "البريد الإلكتروني أو كلمة المرور خاطئة",
      "This email has been used.": "لقد تم استخدام هذا البريد الإلكتروني.",
      //otp
      "Let's get started": "هيا بنا نبدأ",
      "We will send a verification code to your email for confirmation":
          "سنقوم بارسال رمز تحقق للتأكيد علي بريدك الإلكتروني",
      "change": "تغيير",
      "message1": "النقر علي التالي يعني أنك قرأت ووافقت علي",
      "message2": "الأحكام والشروط",
      "message3": "الخاصة باستخدام تطبيق Doctor Bike ",
      "next": "التالي",
      "Verify OTP": "التحقق من OTP",
      "Please enter the verification code": "رجاء ادخل رمز التحقق",
      "verification": "تحقق",
      "verification code": "لم يصلك رمز تحقق؟",
      "Resend during": "اعادة الارسال خلال",
      "Resend": "اعادة الارسال",
      "Verified successfully": "تم التحقق بنجاح",

      //item
      "Ask about the product": "اسأل عن المنتج",
      "Dimensional pictures": "صور الأبعاد",
      "Real pictures": "صور حقيقية",
      "Similar products": "منتجات مشابهة",
      "Do you want to report the product?": "هل تريد الابلاغ عن المنتج ؟",
      "Add an opinion": "إضافة رأي",
      "Size": "الحجم",
      "Color": "اللون",
      "The product contains more than one size in different colors.":
          "المنتج يحتوي علي اكثر من مقاس بالوان مختلفه",
      'Select the desired color': "حدد اللون المطلوب",
      "This product is currently unavailable for purchase.":
          "هذا المنتج غير متاح للشراء حاليا",
      'No Item Found': 'لم يتم العثور على أي عنصر',
      'No SubCategory Found': 'لم يتم العثور على فئة فرعية',
      "item": "العنصر",
      //home
      "Shop now": "تسوق الان",
      "Best selling products": "المنتجات الأكثر مبيعًا",
      "Add": "اضافة",
      "discount": "خصم",
      "Sections": "الأقسام",
      "Your shopping cart is empty": "عربة التسوق فارغة",
      "shopping cart": "عربة التسوق",
      "search": "بحث",
      "pieces": "قطع",
      "left": "متبقي",
      "filtering": "تصفية",
      "condition": "حالة",
      "new": "جديدة",
      "Used": "مستعملة",
      "The Model": "الموديل",
      "Year of manufacture": "سنة التصنيع",
      "the price": "السعر",
      "lowest price": "أدنى سعر",
      "Highest price": "أعلى سعر",
      "Refine search": "تصفية البحث",
      "all": "الكل",
      "Profile": "الملف الشخصي",
      "cart": "العربة",
      "Home": "الرئيسية",
      "Notifications": "الإشعارات",

      //shop
      "Transfer to payment": "إنتقال للدفع",
      "*Price does not include delivery": "*السعر غير شامل التوصيل",
      "number of pieces": "عدد القطع",
      "Pieces": "قطع",
      "Total Price": 'السعر الإجمالي',
      "Discount code": "كود الخصم",
      "Product added": "تم اضافة المنتج",
      "The product has been added previously": "تم اضافة المنتج سابقا",
      "The product has been removed.": "تم ازالةالمنتج",
      "Invoice details": "تفاصيل الفاتورة",
      "order number:": "رقم الطلب:",

      "Alternative mobile number:": "رقم الجوال البديل:",
      "City:": "المدينة:",
      "Detailed address:": "العنوان بالتفصيل:",
      "Delivery price:": "سعر التوصيل:",
      "Total Price": "السعر الإجمالي",
      "(Including delivery)": "(بالشامل التوصيل)",
      "Enter the address in detail.": 'أدخل العنوان بالتفصيل.',
      "Activated": "مفعل",
      "Not activated": "غير مفعل",
      "price": "السعر",
      "Quantity": "الكمية",
      "Do you want to remove this product from the cart ?":
          "هل تريد إزالة هذا المنتج من السلة ؟",
      "Do you want to cancel the order?": "هل تريد إلغاء الطلب؟",

      //acount
      "who we are": "من نحن",

      "who1": "Doctor Bike",
      "who2":
          "نحن شركة متخصصة في بيع وصيانة الدراجات الكهربائية (البسكليتات) والسكوترات الكهربائية والتركترونات الكهربائية ..",
      "who3":
          "نقدّم خدماتنا بجودة عالية واحترافية كبيرة لتلبية احتياجاتكم لتكون لديكم وسيلة تنقل ذكية وعصرية.",
      "who4":
          "انطلق مشروعنا من شغف حقيقي بعالم الدراجات الكهربائية وهدفنا هو تسهيل حياة زبائننا من خلال حلول موثوقة وسريعة، سواء كنت بحاجة إلى شراء بسكليت جديد، أو صيانة دورية، أو إصلاح فوري – نحن هنا لخدمتك.",
      "who5": "ماذا نقدّم؟",
      "who6": "•	بيع دراجات وسكوترات كهربائية من أفضل الماركات وأفضلها جودة",
      "who7": "•	خدمات صيانة وتصليح بكفاءة عالية",
      "who8": "•	قطع غيار أصلية وضمان على الخدمات",
      "who9": "•	تطبيق إلكتروني سهل الاستخدام للحجز والشراء والتواصل",
      "who10": " أكثر من مجرد ورشة – هو شريكك في التنقل الذكي والمستدام.",
      "Payment": "الدفع",
      "Invoice details": "تفاصيل الفاتورة",

      "Full name": "الاسم بالكامل",
      "Mobile number": "رقم الجوال",
      "Alternative mobile number": "رقم الجوال البديل",
      "City": "المدينة",
      "address": "العنوان",
      "Confirm the order": "تأكيد الطلب",
      "Your order has been completed": "تم أكتمال طلبك",
      "Your order is being followed up with number #255 and you will receive a notification of the order status":
          "جاري متابعة طلبك برقم #255 وسيصلك اشعار بحالة الطلب",
      "Add to cart": "إضافة لعربة التسوق",
      "Do you want to cancel the order?": "هل تريد الغاء الطلب ؟",
      "delete account": "حذف الحساب",
      "The account has been deleted": "تم حذف الحساب",
      "Do you want to delete the account?": "هل تريد حذف الحساب ؟",
      "Try using another means of communication.":
          "حاول استخدام وسيلة أخرى للتواصل.",
      "You must register/log in.": "يجب عليك التسجيل / تسجيل الدخول.",
      //Required
      "emailRequired": "البريد الالكتروني مطلوب",
      "nameRequired": " الاسم مطلوب",
      "phoneRequired": "الهاتف  مطلوب",
      "resetMsg": "تم إرسال كلمة المرور الجديدة إلى البريد الإلكتروني",
      "passwordRequired": "كلمة السر مطلوبة",
      "repasswordRequired": "اعادة كلمة السر مطلوبة",
      "oldPasswordRequired": "كلمة المرور القديمة مطلوبة",
      "newPasswordRequired": "كلمة المرور الجديدة مطلوبة",
      'Password must be at least 8 characters':
          "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل",
      'Password must contain letters, numbers, and a special character':
          "يجب أن تحتوي كلمة المرور على أحرف وأرقام ورمز خاص",

      //msg
      'Check the internet connection': "تحقق من الاتصال بالإنترنت",
      'An error occurred. Please try again.': "حدث خطأ. من فضلك حاول مرة أخرى.",
      "ThisEmailNotFound": "لم يتم العثور على هذا البريد الإلكتروني",
      "The verification code is incorrect, please try again.":
          "رمز التحقق غير صحيح، يرجى المحاولة مرة أخرى.",

      //account
      "Profile": "الملف الشخصي",
      "Personal Details": "التفاصيل الشخصية",
      "change password": "تغيير كلمة المرور",
      "My orders": "طلباتي",
      "Terms and Conditions": "الشروط والاحكام",
      "Who are we": "من نحن",
      "Contact us": "اتصل بنا",
      "Doctor Bike will start to apply this change":
          "سيبدأ دكتور بايك بتطبيق هذا التغيير",
      "Change to Arabic": "تغيير إلى اللغة العربية",
      "Change to English": "تغيير إلى اللغة الإنجليزية",
      "Change to Hebrew": "التغيير إلى العبرية",
      "Cancel": "يلغي",
      'the language': 'اللغة',
      'night mode': 'الوضع الليلي',
      "Log out": "تسجيل الخروج",
      "name": "الاسم",
      "save": 'حفظ',
      "Enter the address in detail..": "أدخل العنوان بالتفصيل..",
      "cancel": "إلغاء",
      "Yes": "نعم",
      "Are you sure you want to log out?":
          "هل انت متأكد انك تريد تسجيل الخروج؟",
      'Personal Details': 'التفاصيل الشخصية',
      'Save changes': 'حفظ التغييرات',
      "*The password must be at least 8 numbers and 3 symbols.":
          "*كلمة المرور يجب ألا تقل عن 8 أرقام و 3 رموز",
      "old password": "كلمة المرور السابقة",
      "New Password": "كلمة المرور الجديدة",
      "Please enter the data below.": 'رجاء إدخال البيانات بالأسفل',
      'change password': 'تغيير كلمة المرور',
      "Terms and Conditions": 'الشروط والأحكام',
      "Terms and Conditions for Using the Doctor Bike App":
          'الشروط والأحكام لاستخدام تطبيق Doctor Bike\n',
      "Welcome to the Doctor Bike app. Please read these terms and conditions carefully before use.":
          'مرحبًا بك في تطبيق Doctor Bike. يرجى قراءة هذه الشروط والأحكام بعناية قبل الاستخدام، ',
      "By using this application, you agree to be bound by these terms and conditions.":
          'حيث إن استخدامك لهذا التطبيق يعني موافقتك على الالتزام بهذه الشروط والأحكام.',
      "1. Acceptance of the Terms": "1. قبول الشروط",
      "By downloading or using the Doctor Bike App, you agree to all terms and conditions set forth herein.":
          "عند تحميلك أو استخدامك لتطبيق Doctor Bike، فإنك توافق على جميع الشروط والأحكام المنصوص عليها هنا.",
      "2. Registration and Use of the Account": "2. التسجيل واستخدام الحساب",
      "• The user must create an account to use the application with accurate and complete information.\n":
          "• يجب على المستخدم إنشاء حساب لاستخدام التطبيق بمعلومات دقيقة وكاملة.\n",
      "You are responsible for protecting your account and notifying us immediately of any unauthorized activity.":
          "• أنت مسؤول عن حماية حسابك وإبلاغنا فورًا بأي نشاط غير مصرح به.",
      "3. Permitted Use": "3. الاستخدام المسموح به",
      "You are permitted to use the Application only for lawful purposes in accordance with these Terms.":
          "يسمح لك باستخدام التطبيق فقط للأغراض القانونية وفقًا لهذه الشروط.",
      "Contact us": 'اتصل بنا',
      "Our friendly team is ready to talk to you during business hours.":
          'فريقنا الودود على استعداد للتحدث معك خلال فترة ساعات العمل',
      "message": "رسالة",
      "or": "أو",
      'reset password': "إعادة تعيين كلمة المرور",
      "Completed requests": 'طلبات مكتملة',
      'Current requests': 'طلبات جارية',
      'Cancelled requests': 'طلبات ملغية',
      'Order status': 'حالة الطلب',
      'Request creation date': 'تاريخ إنشاء الطلب',
      'Products': 'المنتجات',
      "ongoing": "جارية",
      "More": "المزيد",
      "less": "اقل",
      "Canceled": "ملغية",
      "Complete": "مكتملة",
      "Password Not Match": "كلمة المرور غير متطابقة",
      "Incorrect password.": "كلمة المرور غير صحيحة.",
      "PasswordsMustBeAtLeast8Characters":
          "يجب أن تكون كلمة المرور 8 أحرف على الأقل",
      "PasswordsMustHaveAtLeastOneLowercaseAndOneUppercase":
          "يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل وحرف كبير واحد على الأقل",
      "The password has been changed.": "لقد تم تغيير كلمة المرور.",
      "Account information has been updated": "تم تحديث بيانات الحساب",
      "No complete applications": "لا توجد طلبات مكتملة",
      "There are no pending orders.": "لا توجد طلبات معلقة",
      "There are no canceled orders.": "لا توجد طلبات ملغاة.",
      "No orders found": "لم يتم العثور على طلبات",
      "register/log in.": "التسجيل/تسجيل الدخول.",
    },
    "en": {
      "skip": "skip",
      "titleSplash1": "Welcome to Doctor Bike",
      "bodySplash1":
          "Discover the best offers for new and used electric bikes, plus all the accessories you need for a comfortable and safe riding experience. Choose your bike today and enjoy freedom on the road!",
      "titleSplash2":
          "Go with Doctor Bike and make the most of electric mobility!",
      "bodySplash2":
          "Whether you're looking for a new or used bike, or need great accessories, we're here to provide everything you need for a great riding experience.",
      "titleSplash3": "Are you ready to go?",
      "bodySplash3":
          "Enjoy a unique purchasing experience with [App Name]! Choose from the finest new and used electric bikes, plus accessories that add value to every ride",
      'Select your language': "Select your language",
      //auth
      "intro": "Welcome to",
      "nameApp": "Doctor Bike",
      "intro2": "Welcome to the Doctor Bike app",
      "createAccount": "Create an account",
      "logIn": "Login",
      "Or": "Or",
      "LoginWith": "Login with",
      "welcomeBack": "Welcome back!",
      "welcome": "welcome!",
      "email": "e-mail",
      "password": "password", "FullName": "Full Name",
      "phoneNumber": "phone number",
      "Remember me": "Remember me",
      "forgetPassword": "Did you forget your password?",
      "Don't have an account": "Don't have an account?",
      "subscription": "subscription",
      "ConfirmPassword": "Confirm password",
      "SubscribeNow": "Subscribe now",
      "Already have an account": "Already have an account?",
      "createAccount successfully": "Account created successfully",
      "Login successfully": "Login successfully",
      "Wrong email or password": "Wrong email or password",
      "This email has been used.": "This email has been used.",
      //otp
      "Let's get started": "Let's get started",
      "We will send a verification code to your email for confirmation":
          "We will send a verification code to your email for confirmation",
      "change": "changing",
      "message1": "Clicking next means you have read and agree to me",
      "message2": "terms and conditions",
      "message3": "For using the Doctor Bike application",
      "next": "next",
      "Verify OTP": "Verify OTP",
      "Please enter the verification code":
          "Please enter the verification code",
      "verification": "verification",
      "verification code": "Didn't receive a verification code?",
      "Resend during": "Resend during",
      "Resend": "Resend",
      "Verified successfully": "Verified successfully",

      //home
      "Shop now": "Shop now",
      "Best selling products": "Best selling products",
      "Add": "Add",
      "discount": "discount",
      "Sections": "Sections",
      "Your shopping cart is empty": "Your shopping cart is empty",
      "shopping cart": "shopping cart",
      "search": "search",
      "pieces": "pieces",
      "left": "left",
      "Profile": "Profile",
      "cart": "cart",
      "Home": "Home",
      "Notifications": "Notifications",

      //item
      "Ask about the product": "Ask about the product",
      "Dimensional pictures": "Dimensional pictures",
      "Real pictures": "Real pictures",
      "Similar products": "Similar products",
      "filtering": "filtering",
      "condition": "condition",
      "new": "new",
      "Used": "Used",
      "The Model": "The Model",
      "Year of manufacture": "Year of manufacture",
      "lowest price": "lowest price",
      "Highest price": "Highest price",
      "Refine search": "Refine search",
      "all": "all",
      "Do you want to report the product?":
          "Do you want to report the product?",
      "Add an opinion": "Add an opinion",
      "Size": "Size",
      "Color": "Color",
      "The product contains more than one size in different colors.":
          "The product contains more than one size in different colors.",
      'Select the desired color': 'Select the desired color',
      "This product is currently unavailable for purchase.":
          "This product is currently unavailable for purchase.",
      'No Item Found': 'No Item Found',
      'No SubCategory Found': 'No SubCategory Found',
      "item": "item",
      //shop
      "Transfer to payment": "Transfer to payment",
      "*Price does not include delivery": "*Price does not include delivery",
      "number of pieces": "number of pieces",
      "Pieces": "Pieces",
      "Total Price": "Total Price",
      "the price": "the price",
      "Discount code": "Discount code",
      "Product added": "Product added",
      "The product has been added previously":
          "The product has been added previously",
      "The product has been removed.": "The product has been removed.",
      "Invoice details": "Invoice details",
      "order number:": "order number:",
      "Full Name:": "Full Name:",
      "Mobile number:": "Mobile number:",
      "Alternative mobile number:": "Alternative mobile number:",
      "City:": "City:",
      "Detailed address:": "Detailed address:",
      "Delivery price:": "Delivery price:",
      "Total Price": "Total Price",
      "(Including delivery)": "(Including delivery)",
      "Enter the address in detail.": "Enter the address in detail.",
      "Activated": "Activated",
      "Not activated": "Not activated",
      "price": "price",
      "Quantity": "Quantity",
      "Do you want to remove this product from the cart ?":
          "Do you want to remove this product from the cart ?",
      "Do you want to cancel the order?": "Do you want to cancel the order?",

      //acount
      "who we are": "About Us",

      "who1": "Doctor Bike",
      "who2":
          "We are a company specializing in the sale and maintenance of electric bicycles, electric scooters, and electric tricycles.",
      "who3":
          "We offer high-quality, professional services to meet your needs for a smart and modern means of transportation.",
      "who4":
          "Our project was born from a true passion for the world of electric bicycles, and our goal is to make our customers' lives easier with reliable and fast solutions. Whether you need to purchase a new bicycle, receive periodic maintenance, or an immediate repair, we are here to serve you.",
      "who5": "What Do We Offer?",
      "who6":
          "• Selling the best and highest-quality brands of electric bicycles and scooters.",
      "who7": "• Highly efficient maintenance and repair services.",
      "who8": "• Original spare parts and a warranty on services.",
      "who9":
          "• An easy-to-use online application for booking, purchasing, and communication.",
      "who10":
          "More than just a workshop—it's your partner in smart and sustainable mobility.",
      "Payment": "Payment",
      "Invoice details": "Invoice details",
      "Full name": "Full name",
      "Mobile number": "Mobile number",
      "Alternative mobile number": "Alternative mobile number",
      "City": "City",
      "address": "address",
      "Confirm the order": "Confirm the order",
      "Your order has been completed": "Your order has been completed",
      "Your order is being followed up with number #255 and you will receive a notification of the order status":
          "Your order is being followed up with number #255 and you will receive a notification of the order status",
      "Add to cart": "Add to cart",
      "Contact us": "Contact us",
      "Our friendly team is ready to talk to you during business hours.":
          "Our friendly team is ready to talk to you during business hours.",
      "Do you want to cancel the order?": "Do you want to cancel the order?",
      "delete account": "delete account",
      "The account has been deleted": "The account has been deleted",
      "Do you want to delete the account?":
          "Do you want to delete the account?",
      "Try using another means of communication.":
          "Try using another means of communication.",
      "You must register/log in.": "You must register/log in.",
      //Required
      "emailRequired": "Email is required",
      "nameRequired": "Name is required",
      "phoneRequired": "phone is required",
      "resetMsg": "New Password have been sent to email",
      "passwordRequired": "Password is required",
      "repasswordRequired": "RePassword is required",
      "oldPasswordRequired": "Old Password is required",
      "newPasswordRequired": "New password is required",
      'Password must be at least 8 characters':
          'Password must be at least 8 characters',
      'Password must contain letters, numbers, and a special character':
          'Password must contain letters, numbers, and a special character',

      //msg
      'Check the internet connection': 'Check the internet connection',
      'An error occurred. Please try again.':
          'An error occurred. Please try again.',
      "ThisEmailNotFound": "This Email Not Found",
      "The verification code is incorrect, please try again.":
          "The verification code is incorrect, please try again.",

      //account
      "Profile": "Profile",
      "Personal Details": "Personal Details",
      "change password": "change password",
      "My orders": "My orders",
      "Terms and Conditions": "Terms and Conditions",
      "Who are we": "Who are we",
      "Contact us": "Contact us",
      "Doctor Bike will start to apply this change":
          "Doctor Bike will start to apply this change",
      "Change to Arabic": "Change to Arabic",
      "Change to English": "Change to English",
      "Change to Hebrew": "Change to Hebrew",
      "Cancel": "Cancel",
      'the language': 'the language',
      'night mode': 'night mode',
      "Log out": "Log out",
      "name": "name",
      "save": "save",
      "Enter the address in detail..": "Enter the address in detail..",
      "cancel": "cancel",
      "Yes": "Yes",
      "Are you sure you want to log out?": "Are you sure you want to log out?",
      'Personal Details': 'Personal Details',
      'Save changes': 'Save changes',
      "*The password must be at least 8 numbers and 3 symbols.":
          "*The password must be at least 8 numbers and 3 symbols.",
      "old password": "old password",
      "New Password": "New Password",
      "Please enter the data below.": "Please enter the data below.",
      'change password': 'change password',
      "Terms and Conditions": "Terms and Conditions",
      "Terms and Conditions for Using the Doctor Bike App":
          "Terms and Conditions for Using the Doctor Bike App\n",
      "Welcome to the Doctor Bike app. Please read these terms and conditions carefully before use.":
          "Welcome to the Doctor Bike app. Please read these terms and conditions carefully before use.",
      "By using this application, you agree to be bound by these terms and conditions.":
          "By using this application, you agree to be bound by these terms and conditions.",
      "1. Acceptance of the Terms": "1. Acceptance of the Terms",
      "By downloading or using the Doctor Bike App, you agree to all terms and conditions set forth herein.":
          "By downloading or using the Doctor Bike App, you agree to all terms and conditions set forth herein.",
      "2. Registration and Use of the Account":
          "2. Registration and Use of the Account",
      "• The user must create an account to use the application with accurate and complete information.\n":
          "• The user must create an account to use the application with accurate and complete information.\n",
      "You are responsible for protecting your account and notifying us immediately of any unauthorized activity.":
          "You are responsible for protecting your account and notifying us immediately of any unauthorized activity.",
      "3. Permitted Use": "3. Permitted Use",
      "You are permitted to use the Application only for lawful purposes in accordance with these Terms.":
          "You are permitted to use the Application only for lawful purposes in accordance with these Terms.",
      "message": "message",
      "or": "or",
      'reset password': 'reset password',
      "Completed requests": "Completed requests",
      'Current requests': 'Current requests',
      'Cancelled requests': 'Cancelled requests',
      'Order status': 'Order status',
      'Request creation date': 'Request creation date',
      'Products': 'Products',
      "ongoing": "ongoing",
      "More": "More",
      "less": "less",
      "Canceled": "Canceled",
      "Complete": "Complete",
      "Password Not Match": "Password Not Match",
      "Incorrect password.": "Incorrect password.",
      "PasswordsMustBeAtLeast8Characters":
          "Passwords Must Be At Least 8 Characters",
      "PasswordsMustHaveAtLeastOneLowercaseAndOneUppercase":
          "Passwords Must Have At Least One Lowercase And One Uppercase",
      "The password has been changed.": "The password has been changed.",
      "Account information has been updated":
          "Account information has been updated",
      "No complete applications": "No complete applications",
      "There are no pending orders.": "There are no pending orders.",
      "There are no canceled orders.": "There are no canceled orders.",
      "No orders found": "No orders found",
      "register/log in.": "register/log in.",
    },
  };
}
