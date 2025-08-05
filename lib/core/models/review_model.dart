// class ReviewModel {
//   final String userName;
//   final String userImage;
//   final String review;
//   final String date;
//   final num rate;
//
//   ReviewModel({
//     required this.userName,
//     required this.userImage,
//     required this.review,
//     required this.date,
//     required this.rate
//   });
//
//   factory ReviewModel.fromJson(Map<String, dynamic> json) {
//     return ReviewModel(
//       userName: json['userName'],
//       userImage: json['userImage'],
//       review: json['review'],
//       date: json['date'],
//       rate: json['rate'],
//     );
//   }
//   toEntity(){
//     return ReviewModel(
//       userName: userName,
//       userImage: userImage,
//       review: review,
//       date: date,
//       rate: rate,
//     );
//   }
//   toJson(){
//     return {
//       'userName':userName,
//       'userImage':userImage,
//       'review':review,
//       'date':date,
//       'rate':rate,
//     };
//   }
// }
//
//
class ReviewModel {
  final String userName;
  final String userImage;
  final String review;
  final String date;
  final num rate;

  ReviewModel({
    required this.userName,
    required this.userImage,
    required this.review,
    required this.date,
    required this.rate,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
      review: json['review'] ?? '',
      date: json['date'] ?? '',
      rate: json['rate'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userImage': userImage,
      'review': review,
      'date': date,
      'rate': rate,
    };
  }
}
