part of values;

class NeuMorphic {
  Widget neuContainer(Widget widget) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: (Colors.grey[500])!,
                  offset: const Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1),
              const BoxShadow(
                  color: (Colors.white),
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1)
            ]),
        child: widget);
  }
}
