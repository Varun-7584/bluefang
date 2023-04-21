// ignore_for_file: must_be_immutable, no_logic_in_create_state, prefer_const_constructors, prefer_final_fields, avoid_init_to_null, use_build_context_synchronously


import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VinField extends StatefulWidget {
  String vinStr;
  bool fieldHasFocus = true;
  
  VinField({Key? key, required this.vinStr}) : super(key: key);
  @override
  State<VinField> createState() => VinFieldState(vinStr: vinStr);
}

class VinFieldState extends State<VinField>{
  String vinStr; 
  Icon all17Icon = Icon(Icons.clear, color: Colors.red);
  List<String> _options = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    //'i' is not allowed in VINs
    'J',
    'K',
    'L',
    'M',
    'N',
    //'o' is not allowed in VINs
    'P',
    //'q' is not allowed in VINs
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  ];
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  String? wmi = null;

  VinFieldState({required this.vinStr}) : super();

  @override
  void initState(){
    super.initState();
    _options.add(vinStr);
    textEditingController.text = vinStr;

    if (vinStr.length == 17){
      all17Icon = Icon(Icons.check, color: Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramdatatracformBloc, ProgramdatatracformState>(
      buildWhen: (p, c) => p.isEditing != c.isEditing || p.showErrorMessages != c.showErrorMessages,
      builder: (context, state) {
        //log("$_options");
        //log("");
      /// Currently, if the user selects the VIN box and then tries to program the datatrac, it will not check for the length requirement.
        return Focus(
          // child: RawAutocomplete<String>(
          //   optionsBuilder: (TextEditingValue textEditingValue) async {
          //     final List<String> optionsList = [];
          //     List<String> tempList = [];

          //     if (textEditingValue.text.length < 15){
          //       if (wmi == null){
          //           if (getIt.isRegistered<VinSuggestionsRepository>()){
          //             wmi = await getIt<VinSuggestionsRepository>().getWmi(
          //               vehicleType: state.programmedDataTrac.modelAndFuel.vehType.getOrCrash(), 
          //               makeNumber: state.programmedDataTrac.modelAndFuel.vehMake.getOrCrash()
          //             );
          //             wmi ??= "";
          //           } else {
          //             log("Instance was not registered.");
          //           }
          //         }
          //       tempList = await getIt<VinSuggestionsRepository>().getPossibleChars(
          //         wmi: wmi ?? "000", 
          //         year: state.programmedDataTrac.modelAndFuel.vehYear.getOrCrash() + 2000, 
          //         position: textEditingValue.text.length + 1
          //       );
          //     }
          //     for (final String option in _options){
          //       if (tempList.contains(option)){
          //         optionsList.add(option);
          //       }
          //     }
          //     return optionsList;
          //   },
          //   textEditingController: textEditingController,
          //   focusNode: focusNode,
          //   // initialValue: TextEditingValue(text: vinStr),
          //   fieldViewBuilder: (
          //     BuildContext context, 
          //     TextEditingController controller, 
          //     FocusNode focusNode,
          //     VoidCallback onFieldSubmitted
          //   ){
          //     return 
            child:  BFInputAndImage(
                focusNode: focusNode,
                textController: textEditingController,
                imagePath: "assets/images/VINIcon.png",
                hintText: AppLocalizations.of(context)!.vin,
                outline: true,
                maxLength: 17,
                label: AppLocalizations.of(context)!.vin,
                suffixIcon: all17Icon,
                onChanged: (String value) async { 
                  if (value.length == 17){
                    setState(() {
                      all17Icon = Icon(Icons.check, color: Colors.green);
                    });
                  }
                  else {
                    setState(() {
                      all17Icon = Icon(Icons.clear, color: Colors.red);
                    });
                    
                  }
                  context
                    .read<ProgramdatatracformBloc>()
                    .add(ProgramdatatracformEvent.vinNumberChanged(value));
                },
                validator: (input) {
                  return validateTheInput(context, input ?? "",
                      hasFocus: widget.fieldHasFocus);
                },
                inputFormatterList: [FilteringTextInputFormatter.deny(RegExp("[{}|~`]"))],
              ),
          //   },
          //   onSelected: (selection){
          //     context
          //       .read<ProgramdatatracformBloc>()
          //       .add(ProgramdatatracformEvent.vinNumberChanged(selection));
          //   },
          //   optionsViewBuilder: (
          //     BuildContext context,
          //     AutocompleteOnSelected<String> onSelected,
          //     Iterable<String> options
          //   ){
          //     return Align(
          //       alignment: Alignment.topLeft,
          //       child: Material(
          //         elevation: 4, 
          //         child: SizedBox(
          //           height: MediaQuery.of(context).size.height / 6,
          //           child: ListView.builder(
          //             padding: const EdgeInsets.all(2.0),
          //             itemCount: options.length,
          //             itemBuilder: (BuildContext context, int index){
          //               final String option = options.elementAt(index);
          //               return GestureDetector(
          //                 onTap: (){
          //                   onSelected(option);
          //                   if (option.length == 17){
          //                     setState(() {
          //                       all17Icon = Icon(Icons.check, color: Colors.green);
          //                     });
          //                   }
          //                   else {
          //                     setState(() {
          //                       all17Icon = Icon(Icons.clear, color: Colors.red);
          //                     });
          //                   }
          //                 },
          //                 child: ListTile(
          //                   title: Text(option),
          //                 ),
          //               );
          //             }
          //           ),
          //         ),
          //       ), 
          //     );
          //   },
          // ),
          onFocusChange: (hasFocus) {
            if (hasFocus != widget.fieldHasFocus) {
              widget.fieldHasFocus = hasFocus;
            }
          },
        );
      }
    );
  }

  String? validateTheInput(BuildContext context, String text,
      {bool hasFocus = true}) {
    if (text.length == 1){
      return null;
    }
    if (!hasFocus && (text.length < 17)) {
      return AppLocalizations.of(context)!.vinTooShort;
    }
    return context
        .read<ProgramdatatracformBloc>()
        .state
        .programmedDataTrac
        .vehicle
        .vinId
        .value
        .fold(
            (failure) => failure.maybeMap(
                  empty: (f) =>
                      '${AppLocalizations.of(context)!.vin} ${AppLocalizations.of(context)!.fieldEmpty}',
                  orElse: () => AppLocalizations.of(context)!.invalidValue,
                ),
            (validValue) => null);
  }
}
