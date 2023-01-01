import 'package:bloc_example/item/item.dart';
import 'package:bloc_example/item/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemWrapper extends StatelessWidget {
  final Item item;

  const ItemWrapper(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ItemCubit(item),
      child: ItemView(item),
    );
  }
}

class ItemView extends StatelessWidget {
  final Item item; // TODO this should not be here.

  const ItemView(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final cubitItem = context.select((ItemCubit cubit) => cubit.state.item);
    return Container(
        color: Colors.blue,
        child: Column(children: [
          _buildLabelWithText('From cubit:', cubitItem.name),
          _buildLabelWithText('From widget:', item.name),
          BlocBuilder<ItemCubit, ItemState>(builder: (context, state) {
            return Container(
              color: Colors.blue,
              child: Text('BlocBuilder: ${state.item.name}'),
            );
          }),
        ]));

    // return
  }

  Widget _buildLabelWithText(String label, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Text(label), const SizedBox(width: 5), Text(text)],
    );
  }
}
