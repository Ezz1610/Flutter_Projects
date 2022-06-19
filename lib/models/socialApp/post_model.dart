class PostModel{
  late String name;
  late String date;
  late String image;
  late String uId;
  late String text;
  late String postImage;
 // late String postId;



  PostModel({
    required  this.name,
    required this.date,
    required this.text,
    required this.uId,
    required this.image,
    required this.postImage,


  });

  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "text":text,
      "date":date,
      "uId":uId,
      "image":image,
      "postImage":postImage,
    };

  }

  //if we need to receive data
  PostModel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    text=json["text"];
    date=json['date'];
    uId=json['uId'];
    image=json['image'];
    postImage=json['postImage'];
    //postId=json['id'];



  }
}
/*
class PostModelId{
  String? postId;
 late List<String>postsId=[postId!];
}*/
