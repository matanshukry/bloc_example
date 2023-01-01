import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit(Item item) : super(ItemState(item));

  void changeItemName(String newName) {
    final newItem = state.item.copyWith(name: newName);

    emit(ItemState(newItem));
  }
}
