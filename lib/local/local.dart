import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "2": "تخطي",
          "3": "أفضل الصفقات في انتظارك الآن",
          "4": "مرحبا بك في نصيبك",
          "5": "تسجل حساب جديد",
          "6": "تسجل الدخول ",
          "7": "تأكيد",
          "8": "نعم",
          "9": "لا",
          "10": "هل أنت متأكد أنك تريد التغيير؟",
          "11": "الرجاء تسجيل الدخول للمتابعة",
          "12": "البريد الإلكتروني أو الهاتف",
          "13": "أدخل البريد الإلكتروني أو الهاتف",
          "14": "كلمة المرور",
          "15": "هل نسيت كلمة المرور ؟",
          "16": "أدخل البريد الإلكتروني المسجل لدينا",
          "17": "البريد الإلكتروني",
          "18": "استرجاع",
          "19": 'رمز التحقق',
          "20": 'قم بإدخال رمز التحقق المرسل إلى البريد الإلكتروني',
          "21": 'تحقق',
          "22": 'لم يصلني الرمز',
          "23": 'إعادة إرسال',
          "24": 'كلمة مرور جديدة',
          "25": 'أدخل كلمة مرور قوية',
          "26": 'تأكيد كلمة المرور',
          "27": 'حفظ',
          "28": 'إنشاء حساب',
          "29": 'الاسم كامل',
          "30": 'اسم المستخدم',
          "31": 'أدخل اسم المستخدم',
          "32": 'رقم الجوال',
          "33": 'الدول',
          "34": 'المدينة',
          "35": 'أتعهد بصحة البيانات',
          "36": ' أوافق على',
          "37": ' شروط التسجيل',
          "38": ' و ',
          "39": ' سياسة الخصوصية',
          "40": ' تنشيط العضوية',
          "41": 'مرحبا بك',
          "42": 'الصفقات',
          "43": 'المنتهية',
          "44": 'صفقاتي',
          "45": 'يبدأ من',
          "46": 'الباقات',
          "47": 'اشتري الباقات للتمتع بخدمتنا',
          "48": 'رصيدي',
          "49": 'تذكرة',
          "50": 'نقطة',
          "51": 'الباقة الذهبية',
          "52": 'الباقة الماسية',
          "53": 'الباقة البرونزية',
          "54": 'شراء الآن',
          "55": 'تم شراء الباقة بنجاح',
          "56": 'تم إضافة',
          "57": ' تذاكر و',
          "58": 'نقطة إلى حسابك',
          "59": 'الرئيسية',
          "60": 'سجل الباقات',
          "61": 'المكافآت',
          "62": 'استبدل مكافآتنا بمنتجات مقابل النقاط',
          "63": 'شحن',
          "64": 'مقابل',
          "65": 'عروض الشركاء',
          "66": 'تعرف على الشركاء واستفد من الخصومات',
          "67": 'المزيد عن الشريك',
          "68": 'استبدال',
          "69": 'متوفر',
          "70": 'استبدال المكافأة',
          "71": 'سيتم استبدال المكافأة مقابل',
          "72": 'هل تريد الاستبدال ؟',
          "73": 'نعم ، استبدال المكافأة',
          "74": 'تم طلب استبدال المكافأة بنجاح',
          "75": 'سيتم التواصل معك قريباً',
          "76": 'متابعة',
          "77": 'ستحصل على',
          "78": 'ريال',
          "79": 'السعر الأصلي',
          "80": 'السعر الابتدائي',
          "81": 'تذاكر',
          "82": 'عدد التذاكر',
          "83": 'معلومات عن المنتج',
          "84": 'معلومات الصفقة',
          "86": 'دخول الصفقة',
          "87": 'عند دخولك الصفقة سيتم خصم عدد',
          "88": 'تذكرة من رصيدك',
          "89": 'وستحصل على',
          "90": 'نقطة مكافآت',
          "91": 'حدد سعرك',
          "92": 'السعر',
          "93": 'إرسال',
          "94": 'تم الاشتراك بالصفقة بنجاح',
          "95": 'تم إضافة النقاط إلى رصيدك',
          "96": 'ث',
          "97": 'د',
          "98": 'س',
          "99": 'ي',
          "100": 'تعديل السعر',
          "101": ' عند تعديل  السعر سيتم خصم عدد',
          "102": 'السعر الحالي',
          "103": 'السعر الجديد',
          "104": 'حفظ التعديل',
          "105": 'تم تعديل السعر بنجاح',
          "106": 'يمكنك تعديل السعر في أي وقت',
          "107": 'الفائزين بالصفقة',
          "108": 'شراء',
          "109": 'تم الاشتراك في :',
          "110": 'حظ أوفر في الصفقات الأخرى',
          "111": 'مبروك فوزك بالصفقة',
          "112": ' فضلاً قم باتمام الشراء قبل انتهاء مهلة المحددة',
          "113": 'شراء الصفقة',
          "114": 'كود الخصم',
          "115": 'أدخل كود الخصم',
          "117": 'تفاصيل الفاتورة',
          "118": 'قيمة الصفقة',
          "120": 'قيمة الضريبة المضافة',
          "121": 'تكلفة الشحن',
          "122": 'الإجمالي',
          "123": 'طريقة الدفع',
          "124": 'ر.س',
          "125": 'رقم البطاقة',
          "126": 'تاريخ الانتهاء',
          "127": 'رمز الحماية',
          "128": 'اسمك كما يظهر على البطاقة',
          "129": 'تم الشراء بنجاح',
          "130": 'يمكنك مشاهدة الطلب وتتبع الشحن',
          "131": 'تتبع الشحن',
          "132": 'الملف الشخصي',
          "133": 'شاهد معلومات الحساب',
          "134": 'رقم العضوية',
          "135": 'رصيد التذاكر',
          "136": 'رصيد النقاط',
          "137": 'الأقسام الرئيسية',
          "138": 'الإشعارات',
          "139": 'سجل الصفقات',
          "140": 'سجل الباقات',
          "142": 'عنواني',
          "143": 'المفضلة',
          "144": 'اهتماماتي',
          "145": 'تواصل معنا',
          "146": 'اللغة',
          "147": 'الإعدادات',
          "148": 'مشاركة التطبيق',
          "149": 'تسجيل خروج',
          "150": 'وسائل التواصل الاجتماعي',
          "151": 'الإصدار 2.0',
          "152": 'عن التطبيق',
          "153": 'الشروط والأحكام',
          "154": 'حذف حسابي',
          "155": 'يرجى اختيار اللغة',
          "156": 'العربية',
          "157": 'الإنجليزية',
          "158": 'ماذا ستفقد إذا طلبت حذف حسابك',
          "159": 'ستفقد جميع أنواع المحتوى والبيانات الواردة في هذا الحساب :',
          "160": '- حسابي',
          "161": '- سجل الشراء ',
          "162": '- حق الوصول إلى التطبيق',
          "163": '- هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة',
          "164": 'هل أنت متأكد من حذف حسابك ؟',
          "165": 'لا يمكن التراجع عن هذه الخطوة',
          "166": 'نعم ، حذف',
          "167": 'إلغاء',
          "168": 'التاريخ',
          "169": 'تم الشراء',
          "170": 'تم الشحن',
          "171": 'تم التسليم',
          "172": 'تفاصيل الشراء',
          "173": 'رقم العملية',
          "174": 'الوقت',
          "175": 'هل أنت متأكد أنك تريد الخروج؟',
          "176": 'دعنا نتعرف على ذوقك.',
          "177": 'موبايلات',
          "178": 'اكسسوارات',
          "179": 'الرياضة',
          "180": 'أجهزة كهربائية',
          "181": 'اندية الرياضية',
          "182": 'الصحة والجمال',
          "183": 'عطور',
          "184": 'السيارات',
          "185": 'الفنادق والمنتجعات',
          "186": 'دورات تعليمية',
          "187": 'معلومات الحساب',
          "188": 'تعديل الحساب',
          "189": 'حفظ التعديلات',
          "190": 'هل تريد تغيير رقم الجوال؟',
          "191": 'تغيير كلمة المرور',
          "192": 'تغيير رقم الجوال',
          "193": 'أدخل رقم الجوال الجديد',
          "194": 'كلمة المرور الحالية',
          "196": 'عنوان المنزل',
          "197": 'العنوان',
          "198": 'رقم المنزل',
          "199": 'تفاصيل العنوان',
          "200": 'الرمز البريدي',
          "201": 'عنوان الرسالة',
          "202": 'الرسالة',
          "203": 'خدمة العملاء',
          "204": 'شرح المزاد',
          "205": 'الأسئلة الشائعة',
          "206": 'ما هو تطبيق المزاد؟',
          "207": 'تطبيق المزاد هو تطبيق يتيح للمستخدمين بيع وشراء السلع',
          "208": 'والمنتجات عن طريق المزايدة العلنية.',
          "209": 'كيف يتم تحديد الفائز في المزاد؟',
          "210": 'ما هي ضمانات الدفع والتسليم في تطبيق المزاد؟',
          "211": 'ما هي طرق الدفع المتاحة في تطبيق المزاد؟',
          "212": 'الإشعارات',
          "213": 'مسح الاشعارات',
          "214": 'مبروك الفوز بالصفقة',
          "215": 'منذ 5 ساعات',
          "216": 'مبروك، انت من ضمن المرشحين للفوز بالصفقة',
          "217": 'متبقي 30 دقيقة على انتهاء الصفقة',
          "218": 'حظاً اوفر في الصفقات القادمة',
          "219": 'الغاء',
          "220": 'تحديد الكل',
          "221": 'الغاء تحديد الكل',
          "222":
              'نرجو إتمام عملية الشراء خلال المهلة المتاحة لذلك وهي ثلاثة أيام من وقت إنتهاء الصفقة حتى لا ينتقل حق الشراء عضو آخر',
          "223": 'عرض الصفقة',
          "224": 'مبروك سعرك من ضمن اعلى العروض',
          "225": 'انت لم تخسر بعد ،',
          "226":
              'سعرك من ضمن اعلى العروض المقدمة لشراء الصفقة ، في حال تخلف الفائز الذي يسبقك في الترتيب عن الدفع ، ستكون انت الفائز',
          "227":
              'عند ارسال هذا الاشعار يتبقى على انتهاء الصفقة اقل من 30 دقيقة سارع في الاشتراك في الصفقة او تعديل سعرك في حال رغبتك فالك الفوز',
          "228":
              'الفائز الذي يسبقك في الترتيب اتم عملية الشراء ،ولا يهمك راح نوفر لك الكثير من الصفقات الرائعة، وفالك الفوز',
          "229": 'هل تريد تسجيل خروج من الحساب ؟',
          "230": 'نعم ، تسجيل خروج',
          "231": 'ثانية',
          "232": 'دقيقة',
          "233": 'ساعة',
          "234": 'يوم',
          "235": 'من فضلك ، أضف المنتجات المفضلة لديك.',
          "236": 'الاسم الأول',
          "237": 'الاسم الأخير',

          // 'تاريخ الانتهاء'
        },
        "en": {
          "2": "Skip",
          "3": "The best deals are waiting for you right now",
          "4": "welcome to Naseebak",
          "5": "Register a new account",
          "6": "Sign in",
          "7": "Confirm",
          "8": "Yes",
          "9": "No",
          "10": "Are you sure you want to change?",
          "11": "Please login to continue",
          "12": "email or phone",
          "13": "Enter your email or phone",
          "14": "password",
          "15": "forget your password ?",
          "16": "Enter our registered email",
          "17": "Email",
          "18": "Recovery",
          "19": "verification code",
          "20": "Enter the verification code sent to the email",
          "21": "verification",
          "22": "I did not receive the code",
          "23": "Resend",
          "24": "New password",
          "25": "Enter a strong password",
          "26": "confirm password",
          "27": "Save",
          "28": 'Create an account',
          "29": 'Full Name',
          "30": 'user name',
          "31": 'Enter the username',
          "32": 'Mobile number',
          "33": 'Countries',
          "34": 'City',
          "35": 'I undertake to correct the data',
          "36": 'I agree to',
          "37": 'Registration terms',
          "38": 'And the',
          "39": 'privacy policy',
          "40": 'Membership activation',
          "41": 'Welcome',
          "42": 'Deals',
          "43": 'Ended',
          "44": 'My Deals',
          "45": 'Starts from',
          "46": 'Packages',
          "47": 'Buy packages to enjoy our service',
          "48": 'My Credit',
          "49": 'Ticket',
          "50": 'Point',
          "51": 'Golden Package',
          "52": 'Diamond Package',
          "53": 'Bronze Package',
          "54": 'Buy now',
          "55": 'The package has been successfully purchased',
          "56": 'has been added',
          "57": ' tickets and',
          "58": 'point to your account',
          "59": 'Main',
          "60": 'Register Packages',
          "61": 'Rewards',
          "62": 'Redeem our rewards for products for points',
          "63": 'Shipping',
          "64": 'Opposite',
          "65": 'Partner offers',
          "66": 'Get to know the partners and take advantage of the discounts',
          "67": 'More about the partner',
          "68": 'Replacing',
          "69": 'Available',
          "70": 'Bonus replacement',
          "71": 'The reward will be redeemed for',
          "72": 'Do you want to replace ?',
          "73": 'Yes, redeem the bonus',
          "74": 'Reward redemption request has been successfully completed',
          "75": 'You will be contacted soon',
          "76": 'Tracking',
          "77": 'you will get',
          "78": 'Rial',
          "79": 'The original price',
          "80": 'Starting price',
          "81": 'tickets',
          "82": 'number of tickets',
          "83": 'Product information',
          "84": 'Transaction information',
          "86": 'Entering the deal',
          "87": 'When you enter the deal, a number will be deducted',
          "88": 'ticket from your balance',
          "89": 'and you will get',
          "90": 'reward point',
          "91": 'set your price',
          "92": 'the price',
          "93": 'send',
          "94": 'The deal has been successfully subscribed',
          "95": 'Points have been added to your balance',
          "96": 's',
          "97": 'm',
          "98": 'h',
          "99": 'd',
          "100": 'Adjust the price',
          "101": 'When adjusting the price a counting deduction will be made',
          "102": 'current price',
          "103": 'The new price',
          "104": 'Save the modification',
          "105": 'The price has been modified successfully',
          "106": 'You can adjust the price at any time',
          "107": 'Deal winners',
          "108": 'Buying',
          "109": 'Subscribed to:',
          "110": 'Better luck with the other deals',
          "111": 'Congratulations on winning the deal',
          "112": 'Please complete your purchase before the deadline expires',
          "113": 'Buy the deal',
          "114": 'discount code',
          "115": 'Enter the discount code',
          "117": 'Invoice details',
          "118": 'transaction value',
          "120": 'value added tax',
          "121": 'Shipping charges',
          "122": 'Total',
          "123": 'payment method',
          "124": 'S.R',
          "125": 'Card Number',
          "126": 'Expiry date',
          "127": 'Security code',
          "128": 'Your name as it appears on the card',
          "129": 'Purchase completed successfully',
          "130": 'You can view the order and track the shipment',
          "131": 'Shipping tracking',
          "132": 'Profile personly',
          "133": 'View account information',
          "134": 'Membership No',
          "135": 'Ticket balance',
          "136": 'Points balance',
          "137": 'Main sections',
          "138": 'Notification',
          "139": 'Transaction history',
          "140": 'Packages Register',
          "142": 'My Address',
          "143": 'Favorite',
          "144": 'my interests',
          "145": 'Connect with us',
          "146": 'Language',
          "147": 'Settings',
          "148": 'Share the app',
          "149": 'Log out',
          "150": 'Social media',
          "151": 'Version 2.0',
          "152": 'About the application',
          "153": 'Terms and Conditions',
          "154": 'Delete My Account',
          "155": 'Please select a language',
          "156": 'Arabic',
          "157": 'English',
          "158": 'What will you lose if you request deletion of your account',
          "159":
              'You will lose all types of content and data contained in this account:',
          "160": 'My Account -',
          "161": 'purchase history -',
          "162": 'The right to access the application -',
          "163":
              'This text is an example of text that can be replaced in the same space -',
          "164": 'Are you sure to delete your account?',
          "165": 'This step cannot be undone',
          "166": 'Yes, delete',
          "167": 'cancel',
          "168": 'Date',
          "169": 'Buying succeeded',
          "170": 'charged',
          "171": 'sent delivered handed',
          "172": 'Purchase details',
          "173": 'operation number',
          "174": 'Time',
          "175": "Are you sure you want to exit?",
          "176": 'Let\'s get to know your taste.',
          "177": 'Mobiles',
          "178": 'accessories',
          "179": 'Sports',
          "180": 'Electrical devices',
          "181": 'sports clubs',
          "182": 'health and beauty',
          "183": 'perfumes',
          "184": 'the cars',
          "185": 'Hotels and resorts',
          "186": 'Educational courses',
          "187": 'Account Information',
          "188": 'Modify the account',
          "189": 'Save modifications',
          "190": 'Do you want to change the mobile number?',
          "191": 'change password',
          "192": 'Change the mobile number',
          "193": 'Enter the new mobile number',
          "194": 'Current Password',
          "196": 'Home Address',
          "197": 'The Address',
          "198": 'house number',
          "199": 'Address details',
          "200": 'Postal code',
          "201": 'Title',
          "202": 'the message',
          "203": 'customers service',
          "204": 'Auction explanation',
          "205": 'common questions',
          "206": 'What is the auction application?',
          "207":
              'The auction app is an application that allows users to buy and sell goods',
          "208": 'products by public bidding.',
          "209": 'How is the winner of the auction determined?',
          "210":
              'What are the payment and delivery guarantees in the auction application?',
          "211":
              'What are the payment methods available in the auction application?',

          "212": 'Notifications',
          "213": 'Clear notifications',
          "214": 'Congratulations on winning the deal',
          "215": '5 hours ago',
          "216":
              'Congratulations, you are among the candidates to win the deal',
          "217": '30 minutes left until the deal ends',
          "218": 'Best of luck in the upcoming deals',
          "219": 'cancellation',
          "220": 'select all',
          "221": 'Deselect all',
          "222":
              'We hope to complete the purchase process within the time limit available for that, which is three days from the end of the deal, so that the right to purchase is not transferred to another member.',
          "223": 'View the deal',
          "224": 'Congratulations, your price is among the highest offers',
          "225": 'you haven\'t lost yet,',
          "226":
              "Your price is among the highest offers offered to purchase the deal. In the event that the winner who precedes you in the arrangement fails to pay, you will be the winner.",
          "227":
              'When this notification is sent, less than 30 minutes remain until the end of the deal. Hurry up to participate in the deal or adjust your price in case you want to win.',
          "228":
              'The winner who precedes you in the ranking has completed the purchase process, and you do not care, we will provide you with many wonderful deals, and you will win',
          "229": 'Do you want to log out of the account?',
          "230": 'Yes, sign out',
          "231": 'second',
          "232": 'minute',
          "233": 'hour',
          "234": 'day',
          "235": 'Please, Add your favorites products.',
          "236": 'First Name',
          "237": 'last name',
          //  'Please, Add your favorites products.'
        }
      };
}
//