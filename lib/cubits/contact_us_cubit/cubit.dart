import 'package:creative_shop/cubits/contact_us_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsCubit extends Cubit<ContactUsStates> {
  ContactUsCubit() : super(ContactUsInitialState());

  static ContactUsCubit get(context) => BlocProvider.of(context);

  String? valueChosen;
  bool isVisible = false;

  void changeChosenValue(String? newValue) {
    valueChosen = newValue;
    isVisible = true;
    emit(ChangeDropdownValue());
  }
}
