class Items {
  String name;
  String description;
  double price;
  String imageThumb;
  List<String> imageItems;

  Items(
      {required this.name,
      required this.description,
      required this.price,
      required this.imageThumb,
      required this.imageItems});
}

var itemList = [
  Items(
      name: 'Jacket Sonnig',
      description:
          'New arrival Jacket Sonnig WindBreaker. This jacket is suitable for everyone who want to keep their body warm and still rocking the style.'
          'This Long Sleeve zip up Thin jackets windbreaker suitable for casual wear, street wear, dates and parties or any occasion is perfect in Spring, '
          'Fall and Winter Or as a layer to keep you warm when in office with strongAir-conditioning. The jacket is also suitable '
          'for Motorcycling, Biking, Party, Hiphop, Concert, Travel, College, Driving and Outdoor Activities.',
      price: 29.99,
      imageThumb: 'assets/images/jacket_sonnig1.jpg',
      imageItems: [
        'assets/images/jacket_sonnig1.jpg',
        'assets/images/jacket_sonnig2.jpg',
        'assets/images/jacket_sonnig3.jpg',
        'assets/images/jacket_sonnig4.jpg'
      ]),
  Items(
      name: 'Jacket Bomber',
      description:
          'New arrival Jacket Bomber. Shell and Lining Material: 100% High Density Polyester, Water-repellent and Windproof.'
          'Mens Flight Jackets with simple ribbed stand-up collar, fits naturally and comfortably, and highlighting the contours. '
          'Gathered Knit cuffs can be tightened on the wrist to prevent wind from flowing into; Ribbed waitband design enhances '
          'the edge layering, Keep the cold out and makes you feel.',
      price: 49.99,
      imageThumb: 'assets/images/jacket_bomber1.jpg',
      imageItems: [
        'assets/images/jacket_bomber1.jpg',
        'assets/images/jacket_bomber2.jpg',
        'assets/images/jacket_bomber3.jpg',
        'assets/images/jacket_bomber4.jpg'
      ]),
  Items(
      name: 'Jacket Erigo',
      description:
          'New arrival Jacket Erigo WindBreaker. The material of this jacket is soft, '
          'warm and fuzzy mid-weight polar fleece fabric. 100% polyster and '
          'has a full-length zippered closure at front.',
      price: 19.99,
      imageThumb: 'assets/images/jacket_Erigo1.jpg',
      imageItems: [
        'assets/images/jacket_Erigo1.jpg',
        'assets/images/jacket_Erigo2.jpg',
        'assets/images/jacket_Erigo3.jpg',
        'assets/images/jacket_Erigo4.jpg'
      ]),
  Items(
      name: 'Fit Jean',
      description:
          ' This classic five-pocket jean is constructed with a regular fit through the seat and thigh, made to sit at the natural waist. '
          'Made with durable flex denim, these jeans are built to last and will allow you to move with comfort throughout the day.',
      price: 25.59,
      imageThumb: 'assets/images/jeans_onyx1.jpg',
      imageItems: [
        'assets/images/jeans_onyx1.jpg',
        'assets/images/jeans_onyx2.jpg',
        'assets/images/jeans_onyx3.jpg',
        'assets/images/jeans_onyx4.jpg'
      ]),
  Items(
      name: 'Ripped Jean',
      description:
          'Straight jeans are made of high quality stretch denim, hand feel soft and stretchy,comfortable,suit for everyday casual wear. '
          'Classic high rise floral jean sits at natural waist with functional pockets, easy zipper fly and belt loops for the fit you love.',
      price: 24.99,
      imageThumb: 'assets/images/jeans_ripped1.jpg',
      imageItems: [
        'assets/images/jeans_ripped1.jpg',
        'assets/images/jeans_ripped2.jpg',
        'assets/images/jeans_ripped3.jpg',
        'assets/images/jeans_ripped4.jpg'
      ]),
  Items(
      name: 'Shirt Oxford',
      description:
          'Hidden vents at the shoulders and 100% nylon quick dry fabric make for a shirt that\'s breathable and comfortable during any outdoor activity. '
          'A relaxed, lightweight fit make this fishing shirt the ultimate choice for casual days outside as well as for activity out on the water.',
      price: 12.59,
      imageThumb: 'assets/images/shirt_oxford1.jpg',
      imageItems: [
        'assets/images/shirt_oxford1.jpg',
        'assets/images/shirt_oxford2.jpg',
        'assets/images/shirt_oxford3.jpg',
        'assets/images/shirt_oxford4.jpg'
      ]),
  Items(
      name: 'Ryusei T-Shirt',
      description:
          'Dress up or dress casual, perfect for Golf, Tennis, Rugby, Horse related sports and suitable for most outdoor activities and workouts. '
          'Pique Polo Shirt with Fit Stretch Fabric that is dry fit, moisture-wicking, and provides all day comfort. (UPF 50 ) Safeguards your skin '
          'from ultraviolet rays. Collared dress shirt with Regular Fit design along with 3 Button Plackets for quick adjustments & Comfort.',
      price: 11.99,
      imageThumb: 'assets/images/tshirt_Ryusei1.jpg',
      imageItems: [
        'assets/images/tshirt_Ryusei1.jpg',
        'assets/images/tshirt_Ryusei2.jpg',
        'assets/images/tshirt_Ryusei3.jpg',
        'assets/images/tshirt_Ryusei4.jpg'
      ])
];
