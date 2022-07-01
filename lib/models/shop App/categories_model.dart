import 'package:shop_app/shared/components/constants.dart';

class CategoriesModel{
  late bool status;
  late CategoriesDataModel data1;
  CategoriesModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data1=CategoriesDataModel.fromJson(json['data']);
  }
}

class CategoriesDataModel {
  late int currentPage;
  late List <DataOfCategoryData> data2=[];

  CategoriesDataModel.fromJson(Map<String, dynamic>json)
  {
    currentPage = json["current_page"];
    json['data'].forEach((element){
      data2.add(DataOfCategoryData.fromJson(element));
      printFullText(data2.toString());
    });
  }
}


class DataOfCategoryData{
  late int id;
  late String image;
  late String name;
  DataOfCategoryData.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }
}