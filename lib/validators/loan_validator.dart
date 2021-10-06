class LoanValidator{

  static String? validateField({required String value}){
    // if(value == null || value.isEmpty){
    //   return 'Textfield cannot be empty';
    // }
    // return null;

    if (value == null || value.isEmpty) {

      return 'Please enter some text';

    }
    return null;
  }

  static String? validateUserId({required String uid}){
    if(uid.isEmpty){
      return 'UserId cannot be empty';
    }
    else if(uid.length <= 5){
      return 'User Id should be greater than 5 characters';
    }
    return null;
  }
}