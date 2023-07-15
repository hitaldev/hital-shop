class Review {
  int? id;
  String? comment;
  int? rate;
  String? reply;
  String? date;
  String? user;

  Review({this.id, this.comment, this.rate, this.reply, this.date, this.user});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    rate = json['rate'];
    reply = json['reply'];
    date = json['date'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['rate'] = this.rate;
    data['reply'] = this.reply;
    data['date'] = this.date;
    return data;
  }
}