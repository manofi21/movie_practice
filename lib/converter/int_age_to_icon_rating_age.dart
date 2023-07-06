String intAgeToIconRatingAge(int age) {
  if (age > 17 ) {
    /// return NC-17 karena untuk umur lewat 17 
    return "NC-17";
  }

  if (age <= 17 && age > 16) {
    /// return R karena untuk umur 17 
    return "R";
  }

  if (age <= 16 && age > 12 ) {
    /// return PG-13 karena untuk semua umur 
    return "PG-13";
  }

  if (age <= 12 && age > 9 ) {
    /// return PG karena untuk semua umur 
    return "PG";
  }

  if (age < 9) {
    /// return G karena untuk semua umur 
    return "G";
  }

  return "";
}

/// 0 - 9 => G 
/// 10 - 12 => PG
/// 13 - 16 => PG-13
/// 17 => R
/// 17 < NC-17