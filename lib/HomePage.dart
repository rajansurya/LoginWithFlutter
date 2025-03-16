import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitledtest/services/providers.dart';

class HomePage extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData=ref.watch(postsProvider);
   return Scaffold(
     appBar: AppBar(title: Text("Dio + Riverpod"),),
     body: postData.when(data: (posts)=>
         ListView.builder(
           itemCount: posts.length,
           itemBuilder: (context,index){
               return ListTile(
                 title: Text(posts[index]["title"]) ,
                 subtitle: Text(posts[index]["body"]),
               );
           },
         )

         , error: (obj,erro){

     }, loading: (){
 CircularProgressIndicator();
     }) ,
   );
  }

}