class PostModel{
  late String name;
  late String date;
  late String image;
  late String uId;
  late String text;
  late String postImage;



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



  }
}
class PostModelUpdate{
  late String nameUpdate;
  late String dateUpdate;
  late String imageUpdate;
  late String uIdUpdate;
  late String textUpdate;
  late String postImageUpdate;
  String? postId;



  PostModelUpdate({
    required  this.nameUpdate,
    required this.dateUpdate,
    required this.textUpdate,
    required this.uIdUpdate,
    required this.imageUpdate,
    required this.postImageUpdate,
    this.postId,



  });

  Map<String,dynamic> toMap(){
    return{
      "name":nameUpdate,
      "text":textUpdate,
      "date":dateUpdate,
      "uId":uIdUpdate,
      "image":imageUpdate,
      "postImage":postImageUpdate,
      "postId":postId,

    };

  }

  //if we need to receive data
  PostModelUpdate.fromJson(Map<String,dynamic>json)
  {
    nameUpdate=json['name'];
    textUpdate=json["text"];
    dateUpdate=json['date'];
    uIdUpdate=json['uId'];
    imageUpdate=json['image'];
    postImageUpdate=json['postImage'];
    postId=json['postId'];



  }
}

/*
class PostModelId{
  String? postId;
 late List<String>postsId=[postId!];
}*/
