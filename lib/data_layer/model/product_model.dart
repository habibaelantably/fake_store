class ProductDataModel
{
  late int id;
  late String title;
  late double price;
  late String description;
  late String image;

  ProductDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    title=json['title'];
    price=json['price'].toDouble();
    description=json['description'];
    image=json['image'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'id':id,
        'title':title,
        'price':price,
        'description':description,
        'image':image
      };
  }
}