import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlantScreen extends StatefulWidget {
  static const routeName = '/plant-desc';
  @override
  _PlantScreenState createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final plant = routeArgs['plant']; 
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                      height: 420.0,
                      color: Color(0xFF32A060),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(Icons.arrow_back_ios,size: 30.0,color: Colors.white,),
                            ),
                            Icon(Icons.shopping_cart,size: 30.0,color: Colors.white,),
                          ],
                           ),
                        SizedBox(height: 30.0),
                        Text(
                          plant.category.toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          plant.name,
                          style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'FROM',
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          '\$${plant.price}',
                          style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 30.0),
                        Text(
                          'SIZE',
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          plant.size,
                          style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40.0),
                        RawMaterialButton(
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                          elevation: 2.0,
                          fillColor: Colors.black,
                          child: Icon(Icons.add_shopping_cart, color:Colors.white,size: 30.0),
                          onPressed: (){},
                        ),
                        
                        ],
                      ),
                    ),
                    Positioned(
                          right: 20.0,
                          bottom: 30.0,
                          child: Hero(
                            tag: plant.imageUrl,
                            child: Image(height: 250.0, width: 250.0, image: AssetImage(plant.imageUrl), fit: BoxFit.cover, ),
                          ),
                        ),
                        
                  ],
                ),
                Container(
                  height: 400.0,
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(20.0), 
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0,top: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('All to know...', style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(height: 10.0,),
                          Text(plant.description, style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                          ),),
                        ],
                      ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Details', style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(height: 10.0,),
                          Text('Plant height: 35-45cm', style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                          ),),
                          Text('Nursery pot width: 12cm', style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                          ),),
                        ],
                      ),

                      ),
                    ],
                  ),
                ),
              ],),
            ),
        ),
    );
  }
}