import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/message.dart';
import 'package:flutter_application_1/widgets/chattAppwidget.dart';

class chattAppPage extends StatelessWidget {
   chattAppPage({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
   CollectionReference messages = FirebaseFirestore.instance.collection('messaged');
   TextEditingController controller=TextEditingController();
 static String id='chattApp';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
  future: messages.get(),
  
  builder: (context, snapshot) {
    
    if (snapshot.hasData) {
      List<Message> mlist=[];
      for(int i =0 ; i<snapshot.data!.docs.length ; i++){
        mlist.add(Message.fromJson(snapshot.data!.docs[i]));

      }
      return Scaffold(
        appBar: AppBar(
          title: Text('chattApp'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: mlist.length, // تحديد عدد العناصر
                itemBuilder: (context, index) {
                  return chatApp(messageee:mlist[index]); // يفضل تمرير البيانات هنا إذا كان هناك محتوى ديناميكي
                },
              ),
            ),
            TextField(
              controller: controller, // يجب تعريف المتحكم في الأعلى
              onSubmitted: (value) {
                messages.add({'message': value});
                controller.clear();
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.send),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Center(child: CircularProgressIndicator()); // في حالة عدم تحميل البيانات بعد
  },
);
  }
}