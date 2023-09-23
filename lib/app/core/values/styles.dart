part of values;

class AppTextStyles {
  static final TextStyle header = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.black);

  static final TextStyle header2 = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.black);

  static final TextStyle subHeader = GoogleFonts.lato(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.black.withOpacity(0.8));

  static final TextStyle normalText = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      shadows: [
        const Shadow(
            color: Colors.white, offset: Offset(0.0, 0.2), blurRadius: 0.2),
      ],
      color: Colors.black);

  static final TextStyle normalText2 = GoogleFonts.lato(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.2), blurRadius: 0.2),
      ],
      color: Colors.black);
}
