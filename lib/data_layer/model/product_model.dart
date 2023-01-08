
class ProductDataModel {
  late final List<Data> data;
  ProductDataModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }
}

class Data {
  late int id;
  late String title;
  late double price;
  late String description;
  late String image;
  Data.fromJson(Map<String,dynamic> json){
    id=json['id'];
    title=json['title'];
    price=json['price'].toDouble;
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