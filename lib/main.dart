import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Food> food = [
    Food(
        name: "Pizza",
      imgUrl: "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=800&height=800"
    ),
    Food(
        name: "Burger",
      imgUrl: "https://assets.bonappetit.com/photos/57acae2d1b33404414975121/4:3/w_3235,h_2426,c_limit/ultimate-veggie-burger.jpg"
    ),
    Food(
        name: "Soup",
      imgUrl: "https://www.tasteofhome.com/wp-content/uploads/2018/01/Potato-Beer-Cheese-Soup_EXPS_SBZ19_71598_B09_14_1b-6.jpg"
    ),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network('https://i.pinimg.com/736x/15/45/b4/1545b4097b9905cdd4150073495aed62.jpg', fit: BoxFit.cover,),
          
          DraggableScrollableSheet(
            initialChildSize: 0.3,
              minChildSize: 0.1,
              maxChildSize: 0.90,

              builder: (content, controller) {

            return ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                color: Colors.white70,
                child: ListView.builder(
                  controller: controller,
                  itemCount: food.length,
                  itemBuilder: (_, index) {
                    return Container(
                      child: Card(
                        child: ListTile(
                          title: Text(food[index].name, style: TextStyle(color: Colors.white, fontSize: 24),),

                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(food[index].imgUrl,  width: 50 , height: 50,)),
                        )
                      ),

                    );
                  },
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}


class Food{
  String name;
  String imgUrl;

  Food({this.name, this.imgUrl});
}
