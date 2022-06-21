part of 'items_bloc.dart';

abstract class ItemsEvent extends Equatable {
  const ItemsEvent();

  @override
  List<Object> get props => [];
}

class SelectItem extends ItemsEvent {
  final String tipoItem;
  final item;
  const SelectItem({required this.tipoItem, required this.item});
  @override
  List<Object> get props => [tipoItem, item];
}
