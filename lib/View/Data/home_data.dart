import 'package:urdu_fix/View/Alphabets%20screen/alphabets_screen.dart';
import 'package:urdu_fix/View/Words%20&%20Sentences/words_sentences.dart';

import '../Type Testing/type_testing.dart';

List<String> pages = [
  'Learn\nAlphabets',
  'Words &\nSentences',
  'Test\nTyping',
];
List<String> pageViewTxt = [
  'Master the essence of Urdu with interactive alphabet exploration and pronunciation guidance.',
  'Dive into the intricacies of Urdu sentences with easy romanization and pronunciation assistance for a seamless speaking experience.',
  'Sharpen your Urdu writing skills through interactive typing interface, enhancing both speed and accuracy.',
];
List images = [
  'Assets/images/Learn Alphabets.png',
  'Assets/images/TO SPEAK 2.png',
  'Assets/images/to type.png',
];
List screens = [
  const AlphabetsScreen(),
  WordsSentences(),
   TypeTestingScreen(),
];
