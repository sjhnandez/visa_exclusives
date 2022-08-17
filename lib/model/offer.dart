class Offer {
  final String description;
  final String merchantName;
  final String terms;

  Offer(this.description, this.merchantName, this.terms);

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(json["offerShortDescription"]["text"],
        json["merchantList"][0]["merchant"], json["merchantTerms"]["text"]);
  }
}
