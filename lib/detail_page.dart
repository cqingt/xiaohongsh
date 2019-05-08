import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('作者名字'),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('关注'),
            onPressed: (){},
          ),

          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){}
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _getSwiperList(),
          ],
        ),
      ),
    );
  }

  Widget _getSwiperList() {
    return Swiper(
      itemBuilder: (BuildContext context,int index){
        return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    ),
  }
}
