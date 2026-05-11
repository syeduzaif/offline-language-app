class PackSeed {
  const PackSeed({required this.slug, required this.name, required this.emoji, required this.phrases});
  final String slug;
  final String name;
  final String emoji;
  final List<Map<String, String>> phrases;
}

const List<String> kPackSlugs = [
  'greetings', 'food', 'travel', 'numbers', 'emergency', 'daily',
];

const List<String> kPackEmojis = ['👋', '🍽️', '✈️', '🔢', '🚨', '💬'];
const List<String> kPackNames = ['Greetings', 'Food', 'Travel', 'Numbers', 'Emergency', 'Daily'];

const Map<String, List<String>> kPromptsByPack = {
  'greetings': ['Hello', 'Good morning', 'Thank you', 'Please', 'Goodbye'],
  'food': ['Water', 'Bread', 'Coffee', 'The bill, please', 'Delicious'],
  'travel': ['Where is...?', 'Train station', 'Airport', 'Hotel', 'Ticket'],
  'numbers': ['One', 'Two', 'Three', 'Four', 'Five'],
  'emergency': ['Help!', 'Doctor', 'Police', 'Hospital', 'Call an ambulance'],
  'daily': ['How are you?', 'My name is...', "I don't understand", 'Yes', 'No'],
};

const Map<String, Map<String, List<String>>> kTranslations = {
  'es': {
    'greetings': ['Hola', 'Buenos días', 'Gracias', 'Por favor', 'Adiós'],
    'food': ['Agua', 'Pan', 'Café', 'La cuenta, por favor', 'Delicioso'],
    'travel': ['¿Dónde está...?', 'Estación de tren', 'Aeropuerto', 'Hotel', 'Boleto'],
    'numbers': ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'],
    'emergency': ['¡Ayuda!', 'Médico', 'Policía', 'Hospital', 'Llame a una ambulancia'],
    'daily': ['¿Cómo estás?', 'Me llamo...', 'No entiendo', 'Sí', 'No'],
  },
  'fr': {
    'greetings': ['Bonjour', 'Bon matin', 'Merci', "S'il vous plaît", 'Au revoir'],
    'food': ['Eau', 'Pain', 'Café', "L'addition, s'il vous plaît", 'Délicieux'],
    'travel': ['Où est...?', 'Gare', 'Aéroport', 'Hôtel', 'Billet'],
    'numbers': ['Un', 'Deux', 'Trois', 'Quatre', 'Cinq'],
    'emergency': ['Au secours !', 'Médecin', 'Police', 'Hôpital', 'Appelez une ambulance'],
    'daily': ['Comment ça va ?', "Je m'appelle...", 'Je ne comprends pas', 'Oui', 'Non'],
  },
  'ja': {
    'greetings': ['こんにちは', 'おはよう', 'ありがとう', 'お願いします', 'さようなら'],
    'food': ['水', 'パン', 'コーヒー', 'お会計お願いします', 'おいしい'],
    'travel': ['…はどこですか？', '駅', '空港', 'ホテル', 'チケット'],
    'numbers': ['いち', 'に', 'さん', 'よん', 'ご'],
    'emergency': ['助けて！', '医者', '警察', '病院', '救急車を呼んで'],
    'daily': ['お元気ですか？', '私の名前は…', 'わかりません', 'はい', 'いいえ'],
  },
  'ar': {
    'greetings': ['مرحبا', 'صباح الخير', 'شكرا', 'من فضلك', 'مع السلامة'],
    'food': ['ماء', 'خبز', 'قهوة', 'الحساب من فضلك', 'لذيذ'],
    'travel': ['أين...؟', 'محطة القطار', 'المطار', 'فندق', 'تذكرة'],
    'numbers': ['واحد', 'اثنان', 'ثلاثة', 'أربعة', 'خمسة'],
    'emergency': ['النجدة!', 'طبيب', 'شرطة', 'مستشفى', 'اتصل بسيارة إسعاف'],
    'daily': ['كيف حالك؟', 'اسمي...', 'لا أفهم', 'نعم', 'لا'],
  },
  'hi': {
    'greetings': ['नमस्ते', 'सुप्रभात', 'धन्यवाद', 'कृपया', 'अलविदा'],
    'food': ['पानी', 'रोटी', 'कॉफ़ी', 'बिल दीजिए', 'स्वादिष्ट'],
    'travel': ['... कहाँ है?', 'रेलवे स्टेशन', 'हवाई अड्डा', 'होटल', 'टिकट'],
    'numbers': ['एक', 'दो', 'तीन', 'चार', 'पाँच'],
    'emergency': ['मदद!', 'डॉक्टर', 'पुलिस', 'अस्पताल', 'एम्बुलेंस बुलाओ'],
    'daily': ['आप कैसे हैं?', 'मेरा नाम ... है', 'मुझे समझ नहीं आया', 'हाँ', 'नहीं'],
  },
};
