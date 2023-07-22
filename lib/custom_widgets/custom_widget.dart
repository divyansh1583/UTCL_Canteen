import 'package:flutter/material.dart';
Image logo(String image){
  return Image.asset(
    image,
    fit: BoxFit.fitWidth,
    width: 140,
    height: 140,
  );
}

TextField customTextField(String text, IconData icon,bool isPasswordType,
    TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration:InputDecoration(
      prefixIcon: Icon(icon,color: Colors.white70,),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor:Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(width: 0,style: BorderStyle.none)
      ),
    ),
    keyboardType: isPasswordType?
    TextInputType.visiblePassword:TextInputType.emailAddress,
  );
}
 Container signInUpButton(BuildContext context, bool isLogin,Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height:50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){ onTap();
        },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return Colors.black26;
          }
          return Colors.grey[350];
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        )
      ),
      child:Text(
        isLogin?'Log In':'Sign Up',
        style: const TextStyle(
          color:Colors.black45,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Karla',
        ),),

    ),
  );
 }
// Row customRow(String text, IconData icon,bool isPasswordType,
//     TextEditingController controller){
//   return Row(
//     controller: controller,
//     obscureText: isPasswordType,
//     enableSuggestions: !isPasswordType,
//     autocorrect: !isPasswordType,
//     cursorColor: Colors.white,
//     style: TextStyle(color: Colors.white.withOpacity(0.9)),
//     decoration:InputDecoration(
//       prefixIcon: Icon(icon,color: Colors.white70,),
//       labelText: text,
//       labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor:Colors.white.withOpacity(0.3),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: const BorderSide(width: 0,style: BorderStyle.none)
//       ),
//     ),
//     keyboardType: isPasswordType?
//     TextInputType.visiblePassword:TextInputType.emailAddress,
//   );
