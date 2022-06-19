/*
class FavoritesModel
{
  bool status;
  Null message;
  Data data;

  FavoritesModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int currentPage;
  List<FavoritesData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<FavoritesData>();
      json['data'].forEach((v) {
        data.add(new FavoritesData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class FavoritesData {
  int id;
  Product product;

  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  int id;
  dynamic price;
  dynamic oldPrice;
  int discount;
  String image;
  String name;
  String description;

  Product(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}*/

class  GetFavModel{
   bool ?status;
   GetDataFavModel? data1;
  GetFavModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data1=GetDataFavModel.fromJson(json['data']);
  }
}
class GetDataFavModel {
 late int currentPage;
 late List<ItemDataFav>data2=[];
 GetDataFavModel.fromJson(Map<String,dynamic>json)
   {
     currentPage=json['current_page'];
     json['data'].forEach((element){
       data2.add(ItemDataFav.fromJson(element));
     });

   }

}
class ItemDataFav{
  late int id;
  late DataProductFav productFav;
  ItemDataFav.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    productFav=DataProductFav.fromJson(json['product']);
  }
}
class DataProductFav{
late int id;
late dynamic price;
late dynamic oldPrice;
late int discount;
late String image;
late String name;
DataProductFav.fromJson(Map<String,dynamic>json)
{
  id=json['id'];
  price=json['price'];
  oldPrice=json['old_price'];
  discount=json['discount'];
  image=json['image'];
  name=json['name'];
}
}