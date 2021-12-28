
class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['courses'], item['image']))
    .toList();

var categoriesData = [
  {"name": "Climate Change", 'courses': 17, 'image': "assets/images/climatechangephoto.jpg"},
  {"name": "Alternative Transport", 'courses': 17, 'image': "assets/images/biking.jpg"},
  {
    "name": "Carbon Dioxide",
    'courses': 13,
    'image': "assets/images/carbond.jpg"
  },
  {"name": "Greenhouse Effect", 'courses': 17, 'image': "assets/images/effectg.jpg"},
];
