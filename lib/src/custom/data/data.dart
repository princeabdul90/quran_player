/*
* Developer: Abubakar Abdullahi
* Date: 26/09/2024
*/

import 'package:intl/intl.dart';

String getFormattedString(String value){
 var title = value.replaceAll('_', ' ');
 var val =  title.replaceFirst('quran/', '');
 var val2 =  val.replaceRange(0,4, '');
 return toBeginningOfSentenceCase(val2);
}

List chapName = const [
 q001, q002, q003, q004, q005, q006, q007, q008, q009, q010,
 q011, q012, q013, q014, q015, q016, q017, q018, q019, q020,
];

 const String q001 = 'The Opening';
 const String q002 = 'The Cow';
 const String q003 = 'The Family of Imran';
 const String q004 = 'The Women';
 const String q005 = 'The Table spread with Food';
 const String q006 = 'The Cattle';
 const String q007 = 'The Heights (or The Wall with Elevation)';
 const String q008 = 'The Spoils of War';
 const String q009 = 'The Repentance)';
 const String q010 = 'Jonah)';
 const String q011 = '(Prophet) Hud';
 const String q012 = '(Prophet) Joseph';
 const String q013 = 'The Thunder';
 const String q014 = 'Abraham';
 const String q015 = 'The Rocky Tract';
 const String q016 = 'The Bees';
 const String q017 = 'The Journey by Night';
 const String q018 = 'The Cave';
 const String q019 = 'Mary';
 const String q020 = 'Ta-Ha';