import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar/custom_nav_bar_widget.dart';
import 'add_crop_widget.dart' show AddCropWidget;
import 'package:flutter/material.dart';

class AddCropModel extends FlutterFlowModel<AddCropWidget> {
  ///  Local state fields for this page.

  String? page;

  LatLng? location;

  bool? isActionStarted;

  ///  State fields for stateful widgets in this page.

  // State field(s) for croptype widget.
  FocusNode? croptypeFocusNode;
  TextEditingController? croptypeTextController;
  String? Function(BuildContext, String?)? croptypeTextControllerValidator;
  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  // State field(s) for priceperunit widget.
  FocusNode? priceperunitFocusNode;
  TextEditingController? priceperunitTextController;
  String? Function(BuildContext, String?)? priceperunitTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CropsRecord? addCrops;
  // Model for customNavBar component.
  late CustomNavBarModel customNavBarModel;

  @override
  void initState(BuildContext context) {
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  @override
  void dispose() {
    croptypeFocusNode?.dispose();
    croptypeTextController?.dispose();

    quantityFocusNode?.dispose();
    quantityTextController?.dispose();

    priceperunitFocusNode?.dispose();
    priceperunitTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    customNavBarModel.dispose();
  }
}
