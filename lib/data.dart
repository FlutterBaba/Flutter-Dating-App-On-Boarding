class Model {
  final String image;
  final String title;
  final String dec;
  Model({
    required this.image,
    required this.title,
    required this.dec,
  });
}

final List<Model> list = [
  Model(
    dec:
        "Lorem ipsum dolor sit amet, consectetur otis adipiscing elit. Sed hac iaculis tincidunt semper justo, dignissi, Magna consectetur tincindunt consect",
    image: "assets/image1.png",
    title: "Find Your Partner",
  ),
  Model(
    dec:
        "Lorem ipsum dolor sit amet, consectetur otis adipiscing elit. Sed hac iaculis tincidunt semper justo, dignissi, Magna consectetur tincindunt consect",
    image: "assets/image2.png",
    title: "Express Your Feelings",
  ),
  Model(
    dec:
        "Lorem ipsum dolor sit amet, consectetur otis adipiscing elit. Sed hac iaculis tincidunt semper justo, dignissi, Magna consectetur tincindunt consect",
    image: "assets/image3.png",
    title: "Enjoy Time Together",
  ),
];
