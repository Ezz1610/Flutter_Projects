class MessageModel{
  late String senderId;
  late String text;
  late String date;
  late String receiverId;



  MessageModel({
    required  this.senderId,
    required this.text,
    required this.receiverId,
    required this.date,


  });

  Map<String,dynamic> toMap(){
    return{
      "senderId":senderId,
      "receiverId":receiverId,
      "text":text,
      "date":date,
    };

  }

  //if we need to receive data
  MessageModel.fromJson(Map<String,dynamic>json)
  {
    senderId=json['senderId'];
    receiverId=json["receiverId"];
    text=json['text'];
    date=json['date'];




  }
}