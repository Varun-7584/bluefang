import 'package:bluefang/src/presentation/pages/core/misc/program_data_trac_primitive.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

extension FormDataTracX on BuildContext {
  ProgramDTPrimitive get formDataTrac =>
      Provider.of<FormProgramDT>(this, listen: false).value;
  set formDataTrac(ProgramDTPrimitive value) =>
      Provider.of<FormProgramDT>(this, listen: false).value = value;
}
