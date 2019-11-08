// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:cjyy/utils/http.dart';
// import 'package:cjyy/utils/toast.dart';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   static String tag = 'login-page';
//   @override
//   _LoginPageState createState() => new _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   Jverify jverify = new Jverify();
//   List<JVCustomWidget>widgetList = [];
//   JVUIConfig uiConfig = JVUIConfig();
  
//   GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//   String _phone = '';
//   String _pw = '';
  
//   // 密码显示、隐藏
//   bool _isObscure = true;
//   Color _eyeColor = Colors.grey;

//   final _phone_controller = TextEditingController();

//   @override
//   void initState() {
//     // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness:Brightness.dark);
//     // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

//     _phone_controller.addListener((){
//       // debugPrint('input:${_phone_controller.text}');
//     });
//     super.initState();
//   }
//   @override
//   void dispose() {
//     _phone_controller.dispose();
//     super.dispose();
//   }
  
//   void _onSubmit() async{
//     final form = _formKey.currentState;
//     if(form.validate()) {
//       form.save();
//       // showDialog(context: context, builder: (ctx)=> new AlertDialog(
//       //   content:  new Text('phone: $_phone , pw: $_pw '),
//       // ));
//       String response_content = await HTTP('get:phone_pw_login', {
//         "phone": _phone,
//         "pass": _pw
//       });
//       Map<String, Object> response_map = jsonDecode(response_content);
//       if(response_map['code'] != 200){
//         print('登录异常');
//         Toast.show('登录异常', context);
//         return;
//       }
//       Map<String, Object> data = response_map['data'];
//       final prefs = await SharedPreferences.getInstance();
//       final setTokenResult = await prefs.setString('user_token', data['token']);
//       await prefs.setInt('user_phone', data['phone']);
//       await prefs.setString('user_name', data['name']);
//       if(setTokenResult){
//         debugPrint('保存登录token成功');
//         Navigator.of(context).pushReplacementNamed('/');
//       }else{
//         debugPrint('error, 保存登录token失败');
//       }
//     }
//   }
//   onRigister() async{
//     final result = await Navigator.pushNamed(context, '/rigister');
//     print(result);
//     _phone_controller.text = result;
//   }
//   @override
//   Widget build(BuildContext context) {
//     SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,statusBarIconBrightness:Brightness.dark,
//     );
//     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//     final logo = new Hero(
//       tag: 'hero',
//       child: new CircleAvatar(
//         backgroundColor: Colors.transparent,
//         radius: 48.0,
//         child: new ClipRRect(
//           child: new SizedBox(
//             width: 120,
//             height: 120,
//             child: new Image.asset('images/cjyy_320.jpg', fit: BoxFit.cover),
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(15))
//         ),
//       ),
//     );

//     final phone = new TextFormField(
//       keyboardType: TextInputType.number,
//       autofocus: false,
//       // initialValue: '',
//       controller: _phone_controller,
//       onSaved: (val)=> this._phone = val,
//       validator: (value){
//         if(value.length != 11){
//           return '手机号不存在哦～';
//         }else{
//            return null;
//         }
//       },
//       decoration: new InputDecoration(
//         hintText: '手机号',
//         contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: new OutlineInputBorder(
//           borderRadius: BorderRadius.circular(32.0)
//         )
//       )
//     );

//     final password = new TextFormField(
//       autofocus: false,
//       initialValue: '',
//       onSaved: (val)=> this._pw = val,
//       obscureText: _isObscure,
//       validator: (value){
//         if(value.length < 6 || value.length > 16){
//           return '密码在6-16位数之间哦';
//         }else{
//            return null;
//         }
//       },
//       decoration:  new InputDecoration(
//         hintText: '密码',
//         contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: new OutlineInputBorder(
//           borderRadius: BorderRadius.circular(32.0)
//         ),
//         suffixIcon: IconButton(
//               icon: Icon(
//                 Icons.remove_red_eye,
//                 color: _eyeColor,
//               ),
//               onPressed: () {
//                 setState(() {
//                   _isObscure = !_isObscure;
//                   _eyeColor = _isObscure
//                       ? Colors.grey
//                       : Theme.of(context).iconTheme.color;
//                 });
//               }),
//       ),
//     );

//     final loginButton = new Padding(
//       padding: new EdgeInsets.symmetric(vertical: 16.0),
//       child: Container(
//               width: double.infinity,
//               height: 45,
//               margin: EdgeInsets.only(top: 50,left: 10,right: 10),
//               child: RaisedButton(
//                 onPressed: () {
//                   debugPrint('QAQ');
//                   _onSubmit();
//                 },
//                 shape: StadiumBorder(side: BorderSide.none),
//                 color: Color(0xff44c5fe),
//                 child: Text(
//                   '登录',
//                   style: TextStyle(color: Colors.white,fontSize: 15),
//                 ),
//               ),
//             ),
//     );

//     final forgetLabel = new FlatButton(
//       onPressed: (){
//         print('等死吧');
//       },
//       child: new Text('忘记密码? ',style: new TextStyle(color: Colors.black54),),
//     );
//     final registerLabel = new FlatButton(
//       onPressed: onRigister,
//       child: new Text('注册 ',style: new TextStyle(color: Colors.black54),),
//     );
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.dark,
//       child: new Scaffold(
//         backgroundColor: Colors.white,
//         body: new Center(
//           child: new Center(
//             child: new ListView(
//               shrinkWrap: true,
//               padding: new EdgeInsets.only(left: 24.0,right: 24.0),
//               children: <Widget>[
//                 new Form(
//                   key: _formKey,
//                   child: new Column(
//                     children: <Widget>[
//                       logo,
//                       SizedBox(height: 48.0),
//                       phone,
//                       SizedBox(height: 8.0,),
//                       password,
//                       SizedBox(height: 24.0,),
//                       loginButton,
//                       // forgetLabel,
//                       registerLabel,
//                     ],
//                   ),
//                 )              
//               ],
//             ),
//           ),
//         ),
//       )
//     );
//   }
// }


// https://juejin.im/post/5db63c51e51d452a3d773d0c
// flutter - 图文讲解表单组件基本使用 & 注册实战
