// main.dart
import 'package:flutter/material.dart';
import 'data_model.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Data Example'),
        ),
        body: FutureBuilder(
          future: ApiService.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading data');
            } else {
              List<MyData> dataList = snapshot.data as List<MyData>;
              return MyList(dataList);
            }
          },
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  final List<MyData> dataList;

  MyList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/profile.jpg'), // Replace with your actual image URL
          ),
          title: Text(dataList[index].title),
          subtitle: Text(dataList[index].body),
        );
      },
    );
  }
}
