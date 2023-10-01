import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../constants/error_handle.dart';
import '../../../../../constants/utils.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:provider/provider.dart';
import '../../../../domain/entities/models/products.dart';
import '../../../../domain/repositories/repo.dart';
import '../../../manager/user_provider.dart';

class AdminServices {

  String url = Repository.url;
  
  final cloudinary = CloudinaryPublic('du6xt1im8',
      'kupcmtaq', cache: false,);



  Future<void> sellProduct({
    required BuildContext context,
    required name,
    required description,
    required category,
    required price,
    required quantity,
    required List<File> images}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
       //print(userProvider.user.name);
      List<String> imageURLs = [];
      for (int i = 0; i < images.length; i++) {

        CloudinaryResponse res = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(
                images[i].path, folder: name));
        imageURLs.add(res.secureUrl);}

      Products products = Products(
          category: category,
          images: imageURLs,
          description: description,
          quantity: quantity,
          price: price,
          name: name);
       //print(userProvider.user.name);
      http.Response res = await http.post(
          Uri.parse("$url/admin/add-product"),
          headers:{
            'Content-Type': 'application/json; charset=UTF-8',
            'tokenId': userProvider.user.token,
          },
          body: products.toJson());
       //print(userProvider.user.name);
      //if (!context.mounted) return;
      httpErrorHandle(
        context: context,
          response: res,
          onSuccess: () {
            showSnack(
                context: context,
                message: 'Product Saved successfully');
          },
          );
      Navigator.pop(context);

    }
    catch (e) {
      showSnack(context: context, message: e.toString());
    }
  }

  Future<List<Products>> getAllProducts(BuildContext context) async {
    var uri = Repository.url;
    List<Products> allProducts = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.get(Uri.parse("$uri/admin/all-products"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "tokenId": userProvider.user.token
        },
      );
      httpErrorHandle(
          response: res,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              allProducts.add(
                  Products.fromJson(
                      jsonEncode(
                          jsonDecode(res.body)[i]
                      )
                  )
              );
            }
          },
          context: context);
    }
    catch (e) {
      showSnack(
          context: context,
          message: e.toString()
      );
    }
    return allProducts;
  }

  Future<void> deleteProduct({
        required BuildContext context,
        required VoidCallback onSuccess,
        required  Products product }) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      http.Response res = await http.post(
          Uri.parse("$url/admin/delete-product"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "tokenId": userProvider.user.token
        },
        body:jsonEncode({
          "id":product.id
        })
      );
      httpErrorHandle(response: res,
          onSuccess: () {
        onSuccess();
          },
          context: context);
    }
    catch (e) {


    }
  }
}