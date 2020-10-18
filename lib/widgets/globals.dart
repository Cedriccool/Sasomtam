String type = 'undefined'; // 0 not defined, 1 customer,  shop

String deviceID = '';

String template = 'summer_love';
String igUsername = 'Cedricazn';

String email = "";
String socialLogin = ""; // FB, EM, GG, TW

String igFollowers = "";
String likesFb = "";
String lastFBLikes = "";

double lat = 0.00;
double lng = 122.00;

Map<String, dynamic> currentUser = {};

bool testing = false;

int pubTimer = 45; // minutes

int transitionSeconds = 15;

String currentBanner = 'abstract'; //'rectangle';

bool showFB = false;
bool showIG = false;

bool reloadFB = true;

String fbColor = "#0f2f84";
String igColor = "#de2c76";

bool isVIP = false;

String macBTMirror = '';
String wifiSSID = '';
String wifiPWD = '';
String timezone = 'Unknown';
String mirror = "";

String goURL = '';
String goURLTitle = '';

int rewardCounters = 0;

List<String> testDevices = [
  '8504C9006EAECA14883EE11A7DC9AB11:5554',
  'E799EC0569576FB56EEE0F693AFE0D89'
];

List<String> keywords = [
  'shopping',
  'cooking',
  'food',
  'soda',
  'gadget',
  'coffee',
  'cinema',
  'movie',
  'dating',
  'games',
  'video games',
  'rov',
  'money',
  'manga',
  'travel',
  'bank'
];

String apiURL =
    'http://mirror.shanuy.com/api/'; //'https://likemebox.com/apimirror/';
String apiLIKEMEURL = 'https://likemebox.com/';

bool firstLaunch = true;
bool showTime = true;
bool showTemp = true;
bool showDate = false;
bool showWeather = false;
bool showNotif = false;
bool doBuzzer = true;
bool showFBLikes = false;
bool showMessage = false;
String messagePerso = '';

Map<String, dynamic> config = {};

Map<String, dynamic> listTemplates = {
  'summer_love': 'Summer Love',
  'rock_beach': 'Rock Beach',
  'coffee_lover': 'Coffee Lover',
  'thai_street_food': 'Thai Street',
  'restaurant': 'Restaurant',
  'thai_massage': 'Thai Massage',
  'zen_bamboo': 'Zen Bamboo',
  'fitness_gym': 'Fitness & Gym',
  'dark_black': 'Dark Black',
  'beauty_clinic': 'Beauty Clinic',
  'dental_clinic': 'Dental Clinic',
};

Map<String, dynamic> banners = {
  'abstract': 'Abstract',
  'rectangle': 'Rectangle'
};

// FBX|FBY|FBSZE|FBCOLOR|offsetshadow | color shadow
Map<String, dynamic> posTemplates = {
  'summer_love_fb': '40|290|72|FFFFFF|3|000000', // OK
  // 'summer_love_ig': '55|55|15|FBFBFB',
  'coffee_lover_fb': '40|290|92|0f2f84|3|000000', //OK
  'thai_street_food_fb': '80|190|92|FFFFFF|3|000000', //OK
  'restaurant_fb': '25|200|100|FFFFFF|3|000000', // OK
  'thai_massage_fb': '25|40|100|f3057b|3|FFFFFF', // OK
  'zen_bamboo_fb': '75|360|100|FFFFFF|3|000000', // OK
  'fitness_gym_fb': '175|90|100|FFFFFF|3|000000', // OK
  'dark_black_fb': '75|90|80|000000|0|000000',
  'beauty_clinic_fb': '75|90|80|000000|0|000000',
  'dental_clinic_fb': '75|320|100|FFFFFF|3|000000', //OK
};

Map<String, dynamic> allApps = {
  'org.thunderdog.challegram': 'Telegram',
};

List<String> listAppNotif = [];
List<String> notifications = [];
List<String> forbidApp = [
  'com.android.systemui',
];

List<String> musicApps = [];
