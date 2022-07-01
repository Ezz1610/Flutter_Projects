class SocialUserModel{
  late String name;
  late String phone;
  late String email;
  late String uId;
  late String bio;
  late String image;
  late String cover;


  SocialUserModel({
  required  this.name,
  required this.email,
  required this.phone,
  required this.uId,
    required this.image,
    required this.cover,
    required this.bio,


  });

  Map<String,dynamic> toMap(){
   return{
   "name":name,
   "phone":phone,
   "email":email,
     "uId":uId,
     "image":image,
     "cover":cover,
     "bio":bio,
   };

  }

  //if we need to receive data
  SocialUserModel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    phone=json["phone"];
    email=json['email'];
    uId=json['uId'];
    image=json['image'];
    cover=json['cover'];
    bio=json['bio'];


  }
}