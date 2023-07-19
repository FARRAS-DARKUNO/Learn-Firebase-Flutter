import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

h1(Color color) {
  return GoogleFonts.inter(
    color: color,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );
}

h2(Color color) {
  return GoogleFonts.inter(
    color: color,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
}

h3(Color color) {
  return GoogleFonts.inter(
    color: color,
    fontSize: 25,
    fontWeight: FontWeight.w700,
  );
}

body(Color color) {
  return GoogleFonts.inter(
    color: color,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}

info(Color color) {
  return GoogleFonts.inter(
    color: color,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}

bigFonts(Color color) {
  return GoogleFonts.kumbhSans(
    color: color,
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );
}
