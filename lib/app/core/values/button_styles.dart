part of values;

class ButtonStyles {
  static final ButtonStyle primaryDecoration = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                  color: HexColor.fromHex("#3c4c7c")))),
    backgroundColor:
    MaterialStateProperty.all(Colors.transparent),
  );
}