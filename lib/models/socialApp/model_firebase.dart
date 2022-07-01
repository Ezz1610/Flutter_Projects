
/*

class CommentId
{
  late String name;
  late String date;
  late String image;
  late String uId;
  late String textComment;
  late String postId;
  CommentId.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    textComment=json["textComment"];
    date=json['date'];
    uId=json['uId'];
    image=json['image'];
    postId=json['id'];

  }

}



class LikeId
{
  bool ?like;
  LikeId.fromJson(Map<String,dynamic>json)
  {
    like=json['like'];

  }

}

class Comments
{
  List<CommentId>?listComments;
  Comments.fromJson(String commentId)
  {
    listComments.add(idofcomment)
  }
}

class Likes
{
  List<LikeId>?listLikes;
  Likes.fromJson(String idoflike)
  {
    listLikes.add(idoflike)
  }

}


PostsIdFire{
Comments? commentsData;
Likes   ? likesData;
PostsData ? data;

PostsIdFire.fromJson(Comments comment , Likes like,Map<String,dynamic>json)
    {
    commentsData=comment;
    likesData=like;
    data=PostsData.fromJson(Map<String,dynamic>json);
    }
}






class PostsDataFire
{
  String ?name;
  String ?date;
  String? image;
  String ?uId;
  String ?text;
  String ?postImage;

  PostsDataFire.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    date=json['date'];
    image=json['image'];
    uId=json['uId'];
    text=json['text'];
    postImage=json['postImage'];


  }
}*/
