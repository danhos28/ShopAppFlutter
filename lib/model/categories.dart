class Categories {
  String name;
  String imageThumb;

  Categories({
    required this.name,
    required this.imageThumb,
  });
}

var categoryList = [
  Categories(name: 'All Items', imageThumb: 'assets/images/all.jpg'),
  Categories(name: 'Jackets', imageThumb: 'assets/images/jackets.jpg'),
  Categories(name: 'Shirts', imageThumb: 'assets/images/shirts.jpg'),
  Categories(name: 'Jeans', imageThumb: 'assets/images/jeans.jpg'),
  Categories(name: 'Caps', imageThumb: 'assets/images/caps.jpg'),
];
