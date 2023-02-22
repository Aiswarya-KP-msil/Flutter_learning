import 'dart:convert';

List<ContactsModel> contactsFromJson(String str) => List<ContactsModel>.from(json.decode(str).map((x) => ContactsModel.fromJson(x)));

String contactsToJson(List<ContactsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactsModel {
  ContactsModel({
    required this.id,
    required this.name,
    required this.contacts,
    required this.url,
  });

  String id;
  String name;
  String contacts;
  String url;

  factory ContactsModel.fromJson(Map<String, dynamic> json) => ContactsModel(
    id: json["id"],
    name: json["name"],
    contacts: json["Contacts"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "Contacts": contacts,
    "url": url,
  };
}
