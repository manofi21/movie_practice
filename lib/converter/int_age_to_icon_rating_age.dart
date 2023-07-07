import 'package:flutter/material.dart';

Widget intAgeToIconRatingAge(int age) {
  var ageRating = '';
  if (age > 17) {
    /// return NC-17 karena untuk umur lewat 17
    ageRating = "NC-17";
  }

  if (age <= 17 && age > 16) {
    /// return R karena untuk umur 17
    ageRating = "R";
  }

  if (age <= 16 && age > 12) {
    /// return PG-13 karena untuk semua umur
    ageRating = "PG-13";
  }

  if (age <= 12 && age > 9) {
    /// return PG karena untuk semua umur
    ageRating = "PG";
  }

  if (age < 9) {
    /// return G karena untuk semua umur
    ageRating = "G";
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.3),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white, width: 5),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Text(
      ageRating,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

/// 0 - 9 => G
/// 10 - 12 => PG
/// 13 - 16 => PG-13
/// 17 => R
/// 17 < NC-17
