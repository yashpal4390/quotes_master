// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

TextStyle sty = TextStyle(color: Colors.white, fontSize: 20);
TextStyle sty1 = TextStyle(color: Colors.black, fontSize: 20);


int sel_index = 0;
int qt_index = 0;
List<String> categories = [
  "Love",
  "Calm",
  "Sad",
  "Time",
  "Future",
  "Relationship"
];

List<String> images = [
  "images/heart.jpg",
  "images/calm.jpg",
  "images/sad1.jpg",
  "images/time.jpg",
  "images/future.jpg",
  "images/relationship.jpg",
];

List<String> bg_images = [
  "images/l1.jpg",
  "images/c1.jpg",
  "images/s1.jpg",
  "images/t1.jpg",
  "images/f1.jpg",
  "images/r1.jpg",
];
List<String> Love= [
  "Loved you yesterday, love you still, always have, always will.",
  "You light my heart on fire every time you look my way.",
  "I fell in love the way you fall asleep: slowly, and then all at once."
  "You might not have been my first love, but you were the love that made all the other loves irrelevant."
];

List<String> Calm=[
  "The ideal of calm exists in a sitting cat.",
  "By staying calm, you increase your resistance against any kind of storms.",
  "Give your stress wings and let it fly away."
];

List<String> Sad=[
  "Our greatest joy and our greatest pain come in our relationships with others",
  "It is sad not to love, but it is much sadder not to be able to love.",
  "It’s amazing how someone can break your heart and you can still love them with all the little pieces."
];
List<String> Time=[
  "Time you enjoy wasting is not wasted time.",
  "Time is what we want most but what we use worst.",
  "Time spent with the one you love is never wasted.",
];
List<String> Future=[
  "The man least dependent upon the morrow goes to meet the morrow most cheerfully.",
  "Humanity does not know where to go because no one is waiting for it: not even God.",
  "We steal if we touch tomorrow. It is God’s.",
];
List<String> Relationship=[
  "I exist in two places, here, and where you are",
  "Happily ever after is not a fairy tale, it’s a choice.",
  "Never above you. Never below you. Always beside you."
];


Set<String> Fav_Quotes={};