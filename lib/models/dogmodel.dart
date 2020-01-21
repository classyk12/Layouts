class Dogs {
  int id;
  String image;
  String rating;
  String location;
  String name;

  Dogs(this.id, this.name, this.image, this.location, this.rating);

  static List<Dogs> getAll() {
    return [
      Dogs(1, 'Ruby', 'assets/images/dog1.jpg', 'Portland, OR, USA', '8/10'),
      Dogs(2, 'Rex', 'assets/images/dog2.jpg', 'NewYork, NY, USA', '10/10'),
      Dogs(3, 'Avalah', 'assets/images/dog3.jpg', 'Orlando, OR, USA', '10/10'),
      Dogs(4, 'Lucky', 'assets/images/dog4.jpg', 'Nebraska, NB, USA', '7/10'),
      Dogs(5, 'Ston', 'assets/images/dog5.jpg', 'Missouri, MS, USA', '10/10'),
      Dogs(6, 'Jack', 'assets/images/dog6.jpg', 'Klavan, KL, USA', '10/10'),
      Dogs(7, 'Constant', 'assets/images/dog7.jpg', 'London, LND, UK', '10/10'),
      Dogs(8, 'Farry', 'assets/images/dog8.jpg', 'Portland, OR, UK', '9.5/10'),
      Dogs(9, 'Spark', 'assets/images/dog9.jpg', 'Udinese, UD, ITALY', '10/10'),
      Dogs(10, 'Tyson', 'assets/images/dog10.jpeg', 'Ottawa, UT, CANADA',
          '10/10'),
    ];
  }
}
