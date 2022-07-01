class CommentUserModel{
  late String name;
  late String date;
  late String image;
  late String uId;
  late String textComment;
  late String postId;



  CommentUserModel({
    required  this.name,
    required this.date,
    required this.textComment,
    required this.uId,
    required this.image,
    required this.postId,



  });

  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "textComment":textComment,
      "date":date,
      "uId":uId,
      "image":image,
      "id":postId,
    };

  }

  //if we need to receive data
  CommentUserModel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    textComment=json["textComment"];
    date=json['date'];
    uId=json['uId'];
    image=json['image'];
    postId=json['id'];



  }
}
