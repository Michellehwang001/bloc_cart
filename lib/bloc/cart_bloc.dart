import 'package:cart_bloc/src/item.dart';
import 'package:bloc/bloc.dart';

// 이벤트 정의
enum CartEventType {
  // 카트에 추가
  add,
  // 카트에서 삭제
  remove,
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc extends Bloc<CartEvent, List<Item>> {
  //CartBloc(List<Item> initialState) : super(initialState);
  CartBloc() : super([]);


  // 리턴값인 Stream 은 데이터가 흘러가는 값. async* , yield 사용
  @override
  Stream<List<Item>> mapEventToState(CartEvent event) async*{
    switch(event.type) {
      case CartEventType.add:
        state.add(event.item);
        break;
      case CartEventType.remove:
        state.remove(event.item);
        break;
    }

    yield state;
  }

}