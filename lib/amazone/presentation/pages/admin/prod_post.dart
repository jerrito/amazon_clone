import 'dart:convert';

import 'package:amazon_clone/amazone/presentation/pages/admin/services/admin_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../../constants/error_handle.dart';
import '../../../../constants/utils.dart';
import '../../../../res/assets_res.dart';
import '../../../domain/entities/models/products.dart';
import '../../../domain/repositories/repo.dart';
import '../../manager/user_provider.dart';
import 'add_products.dart';

class ProductsPost extends StatefulWidget {
  const ProductsPost({super.key});

  @override
  State<ProductsPost> createState() => _ProductsPostState();
}

class _ProductsPostState extends State<ProductsPost> {
  UserProvider? userProvider;
  AdminServices adminService=AdminServices();
  @override
  void initState(){
    super.initState();
    userProvider=context.read<UserProvider>();
    getData(context);
  }
  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
    return  Scaffold(
      body:product==null?
        const Center(child: CircularProgressIndicator()):
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
             // padding: EdgeInsets.only(top:40),
              itemCount: product?.length,
                itemBuilder:(context,int index,){
                  var data=product![index];
                 return Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [

                     SizedBox(
                      height: 140,
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(10),
                           child: Image.network(data.images.first,
                           fit: BoxFit.fill,
                            width: 150,
                            height: 140,
                             ),
                         ),

                     ),
                     //SizedBox(height:20),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                          Text(data.name,
                          overflow: TextOverflow.ellipsis,
                            style:const TextStyle(fontSize:20)
                          ),
                           InkWell(
                             onTap:(){
                               deleteProduct(
                                   index,
                                   data);
                             },
                             child: SvgPicture.asset(
                               AssetsRes.TRASH_2
                             ),
                           ) ,
                       ],
                     ),
                    // SizedBox(height:10),
                   ],
                 );
                }, gridDelegate:
             const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,mainAxisSpacing: 20,
            crossAxisSpacing: 10), ),
          ),

      floatingActionButton: FloatingActionButton(
        onPressed:(){
         // print(userProvider.user.token);
          Navigator.push(context,
          PageRouteBuilder(pageBuilder:
          (BuildContext context,animation,secondaryAnim)
          {
            return FadeTransition(opacity: animation.drive(
              Tween(
                begin:0.0,
                end: 1.0
              )
            ),
            child:const AddProducts());
          }
          ));
        },
        child:const Icon(Icons.add),

      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> deleteProduct(
      int index,
      Products products)async {
    adminService.deleteProduct(
        context: context,
        onSuccess: (){
          product?.removeAt(index);
        },
        product: products);
    setState(() {

    });
  }
List<Products>? product=[];

  Future<void> getData(BuildContext context)async{

   product=await adminService.getAllProducts(context);
   setState(() {

   });


  }



  }

