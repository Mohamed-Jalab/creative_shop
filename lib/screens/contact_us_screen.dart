import 'package:creative_shop/cubits/contact_us_cubit/cubit.dart';
import 'package:creative_shop/cubits/contact_us_cubit/states.dart';
import 'package:creative_shop/shared/component.dart';
import 'package:creative_shop/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsScreen extends StatelessWidget {
  final List<String> contactUsList = [
    'Current order issue',
    'Old order issue',
    'Voucher issue',
    'Application/Technical issue',
    'I would like to join as a seller',
    'I would like to join as a driver',
    'Others'
  ];

  ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactUsCubit>(
      create: (context) => ContactUsCubit(),
      child: BlocConsumer<ContactUsCubit, ContactUsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ContactUsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              centerTitle: true,
              title: const Text('Contact Us'),
              elevation: 8,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Why do you want to contact us',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontFamily: 'Poppins'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade200),
                              child: DropdownButton(
                                isExpanded: true,
                                items: contactUsList.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                                onChanged: (newValue) =>
                                    cubit.changeChosenValue(newValue),
                                value: cubit.valueChosen,
                                underline: const SizedBox(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Visibility(
                              visible: cubit.isVisible,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Additional note',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontFamily: 'Poppins'),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Type here...',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(15.0),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade300,
                                                width: 1.0,
                                              ))),
                                      cursorColor: secondaryColor,
                                    ),
                                  )
                                ],
                              )),
                          const SizedBox(height: 16.0,),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: cubit.isVisible,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            message(context,
                                'We will contact you as soon as possible via\n your email.',
                                longTime: 4);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 60),
                            backgroundColor: secondaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          child: const Text('Send',
                              style: TextStyle(fontSize: 24, color: whiteColor)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
