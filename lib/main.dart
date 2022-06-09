import 'package:e_comm/cart.dart';
import 'package:e_comm/a.dart';
import 'package:e_comm/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}










// import 'package:flutter/material.dart';

// void main()=>runApp(const MaterialApp(home: BuildingLayout(),));

// class BuildingLayout extends StatelessWidget {
//   const BuildingLayout({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SizedBox(width: 500.0,child: Image.asset("img/try2.jpg")),
//       Column(children: [
//         Row(mainAxisAlignment: MainAxisAlignment.center,children:[

//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
//             Text("Bihar National Park",style: TextStyle(color: Colors.black,fontSize: 24),),
//             Text("patna,capital",style: TextStyle(color: Colors.grey,fontSize: 18),),
//           ],),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(80.0,20.0,10.0,10.0),
//             child: Row(children: const [Icon(Icons.star,color: Colors.red,size: 55.0,),Text("4.2")],),
//           )
//         ],),
//         Row(mainAxisAlignment: MainAxisAlignment.center,children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(children: [Icon(Icons.phone),Text("phone",style: TextStyle(fontSize: 24.0,color: Colors.blue),)],),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(children: [Icon(Icons.near_me),Text("Route",style: TextStyle(fontSize: 24.0,color: Colors.blue),)],),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(children: [Icon(Icons.share),Text("Share ",style: TextStyle(fontSize: 24.0,color: Colors.blue),)],),
//           ),

//         ],),

//         Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Text("this is best place in Patna that you want to visit in this week of month",softWrap:true,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w200),),
//         ),

//       ],)
//     ],);
//   }
// }

// class Stac extends StatelessWidget {
//   const Stac({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: const Alignment(0,0),
//       children: [
//         const CircleAvatar(backgroundImage: AssetImage("img/comp.jpg"),radius: 100.0,),
//         Container(decoration: const BoxDecoration(color: Colors.black12),
//           child: const Text("Adarsh Kumar",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white)),),
//         const CircleAvatar(backgroundImage: AssetImage("img/comp.jpg"),radius: 100.0,),
//         Container(decoration: const BoxDecoration(color: Colors.black12),
//           child: const Text("Adarsh Kumar",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white)),),
//         const CircleAvatar(backgroundImage: AssetImage("img/comp.jpg"),radius: 100.0,),
//         Container(decoration: const BoxDecoration(color: Colors.black12),
//           child: const Text("Adarsh Kumar",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white)),),
//         const CircleAvatar(backgroundImage: AssetImage("img/comp.jpg"),radius: 100.0,),
//         Container(decoration: const BoxDecoration(color: Colors.black12),
//           child: const Text("Adarsh Kumar",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white)),),

//       ],

//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("This is test site")),
//       body: Column(
//         children: [
//           const Text("It is a text that is written without seen on keyboard in the absence of timeIt is a text that is written without seen on keyboard in the absence of time"),
//           Row(children: [
//             Expanded(child: Image.asset("img/try1.jpg")),
//             Expanded(flex: 2,child: Image.asset("img/try2.jpg")),
//             Expanded(child: Image.asset("img/try3.jpg")),
//           ]),

//           Row(

//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: const [
//                   Icon(Icons.star,color: Colors.grey,),
//                   Icon(Icons.star,color: Colors.grey,),
//                   Icon(Icons.star,color: Colors.grey,),
//                   Icon(Icons.star,color: Colors.red,),
//                   Icon(Icons.star,color: Colors.red,),
//                 ],
//               ),
//               const Text("154 Reviews",
//               style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)

//             ],

//           ),

//           Expanded(
//             child: Row(
//               children: [
//                 Column(children: [Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: const [Icon(Icons.kitchen),Text("PREP",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: Colors.red),),Text("25 min",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.red),)],)],),
//                 const SizedBox(width: 15.0,),
//                 Column(children: [Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: const [Icon(Icons.timer),Text("COOK",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: Colors.red),),Text("1hr",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.red),)],)],),
//                 const SizedBox(width: 15.0,),
//                 Column(children: [Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: const [Icon(Icons.restaurant),Text("FEED",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: Colors.red),),Text("4-6",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.red),)],)],),
//                 const SizedBox(width: 15.0,),
//               ]
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class List extends StatefulWidget {
//   const List({ Key? key }) : super(key: key);

//   @override
//   State<List> createState() => _ListState();
// }

// class _ListState extends State<List> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("ListTile Layout")),
//       body: ListView(children: const[
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ListTile(title: Text("The title"),subtitle: Text("A subtitle"),leading: Icon(Icons.tiktok),),
//         ],),

//     );
//   }
// }
