class FundTransferValidator{
  static String? validateNameField({required String data}){
    if(data == null || data.isEmpty){
      return 'This field cannot be empty.';
    }
    return null;
  }

  static String? validateAccountNoField({required String data}){
    if(data == null || data.isEmpty){
      return 'This field cannot be empty.';
    }
    return null;
  }

  static String? validateEmailField({required String data}){
    if(data == null || data.isEmpty){
      return 'This field cannot be empty.';
    }
    return null;
  }

  static String? validateDescriptionField({required String data}){
    if(data == null || data.isEmpty){
      return 'This field cannot be empty.';
    }
    return null;
  }
}