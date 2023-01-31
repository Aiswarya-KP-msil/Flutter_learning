import 'package:flutter/foundation.dart';

class ChatsListItem with ChangeNotifier{
  final String id;
  final String name;
  final String chatDesription;
  final String proPicUrl;
  final DateTime date;

  ChatsListItem(
    {
      @required this.id,
      @required this.name,
      @required this.chatDesription,
      @required this.proPicUrl,
      @required this.date,
    }
  );
}

class ChatsList with ChangeNotifier{
  List <ChatsListItem> _items = [
    ChatsListItem(
        id: 'c1',
        name: 'Mariya',
        chatDesription: 'how are you',
        proPicUrl: 'https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/profile-photos-4.jpg',
        date: DateTime.now()
    ),
    ChatsListItem(
        id: 'c2',
        name: 'John',
        chatDesription: 'I Love you',
        proPicUrl: 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
        date: DateTime.now()
    ),ChatsListItem(
        id: 'c3',
        name: 'mathew',
        chatDesription: 'Good night',
        proPicUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1fmtO1xNV_yphS6OAtcQuuDzupas7MMZotNVJuyvYIoISmh8L827nvt7anM_ZHsKr8EM&usqp=CAU',
        date: DateTime.now()
    ),
    ChatsListItem(
        id: 'c4',
        name: 'francis',
        chatDesription: 'how are you',
        proPicUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROjhf8sII9vcd0lTn_zFdi25zae0qRVOm1Z2CD9Lk1Jc8WWv3Ua80yGbDkWM86eba_jRA&usqp=CAU',
        date: DateTime.now()
    ),
    ChatsListItem(
        id: 'c5',
        name: 'Rose',
        chatDesription: 'how are you',
        proPicUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6LRq4HzJhobJRlf0XNBX0gHPqHP3Uv3AruGeRf85dIlNej9o7n2GfmoHmFDiJI8kRjjM&usqp=CAU',
        date: DateTime.now()
    ),

  ];



  List<ChatsListItem> get items {
    return [..._items];
  }

  void addNewCahat(ChatsListItem chatsListItem){
    final newChat = ChatsListItem(
        id: DateTime.now().toString(),
        name: chatsListItem.name,
        chatDesription: chatsListItem.chatDesription,
        proPicUrl: chatsListItem.proPicUrl,
        date: DateTime.now()
    );
    _items.add(newChat);
    notifyListeners();

  }

  void deleteChat(String id) {
    _items.removeWhere((chat) => chat.id == id);
    notifyListeners();
  }

}