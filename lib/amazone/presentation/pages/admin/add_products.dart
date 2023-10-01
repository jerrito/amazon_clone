import 'dart:io';

import 'package:amazon_clone/amazone/presentation/pages/admin/services/admin_service.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../constants/global_variables.dart';
import '../../../../constants/utils.dart';
import '../../manager/user_provider.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/text_fields.dart';

class AddProducts extends StatefulWidget {
  static const String routeName ="/addProduct";
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {

  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  AdminServices adminService=AdminServices();
  bool loading=false;
  final TextEditingController nameController=TextEditingController();
  final TextEditingController descriptionController=TextEditingController();
  final TextEditingController priceController=TextEditingController();
  final TextEditingController quantityController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar:AppBar(
        backgroundColor:
        GlobalVariables.selectedNavBarColor,
        title: Text(user.name,
        style:const TextStyle(color:Colors.black)) ,
       // actions: [Icon(Icons.mic)],
      ),
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key:formKey,
          child: Visibility(
            visible:!loading,
            replacement: const Center(
              child: CircularProgressIndicator(
              ),),
            child: ListView(
              children: [
               images.isNotEmpty? SizedBox(
            height: 200,
              child: CarouselSlider.builder(
                itemBuilder:(BuildContext context,int i,index){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      images[i],
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: images.length,
                options: CarouselOptions(
                    viewportFraction: 0.9,
                    height: 200
                ),
              ),
            ) : GestureDetector(
                  onTap: uploadPic,
                  child: DottedBorder(
                    color: Colors.black,
                    strokeWidth: 1,
                    child: SizedBox(
                      height:170,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon:const Icon(Icons.file_copy_outlined),
                            onPressed:uploadPic
                          ),
                          const Text("Select Product Images")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                 PrimaryTextFormField(
                  controller: nameController,
                  hintText:"Product name" ,
                  label: const Text("Product name"),
                ),
                const SizedBox(height: 20,),
                 SizedBox(
                  height:100,
                  child: TextFormField(
                    controller: descriptionController,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    validator:(val){
                      if(val!.isEmpty) {
                        return "Enter your description";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText:"Description" ,
                      label: const Text("Description"),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      )
                    ),
                    //label: Text("Description"),
                  ),
                ),
                const SizedBox(height: 20,),
                PrimaryTextFormField(
                  hintText:"Price" ,
                  controller: priceController,
                  label: const Text("Price"),
                ),
                const SizedBox(height: 20,),
                 PrimaryTextFormField(
                   hintText:"Quantity" ,
                  label: const Text("Quantity"),
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20,),
                DropdownButton(
                  value: value,
                    items: categories.map((String e)  {
                  return DropdownMenuItem(
                    value: e,
                      child:Text(e) );
                }).toList(),
                    onChanged: (val){
                  setState((){
                    value=val!;
                  });
                    }),

                DefaultPrimaryButton(
                  onPressed:loading?null:  () async{
                    if(formKey.currentState!.validate() &&
                    images.isNotEmpty){
                      setState(() {
                        loading = true;
                      });
                     await sellProduct();
                    }
                  },
                    child:const Text("Sell") )

              ],
            ),
          ),
        ),
      )
    );
  }
  String value="Mobile";
  List<String> categories=[
    "Mobile",
    "Essentials",
    "Appliances",
    "Books",
    "Fashion"
  ];
  List<File> images=[];
  String? imagePath;

  Future<void> sellProduct()async {
    await adminService.sellProduct(context: context,
        name: nameController.text,
        description: descriptionController.text,
        category: value,
        price: double.parse(priceController.text),
        quantity: int.parse(quantityController.text),
        images: images).whenComplete(() =>
        setState((){
          loading=false;
        }));
  }
  Future<void> uploadPic() async{
  var getImages=await getFileImage();
  setState((){
    images=getImages;
    print(getImages.length);
  });
  print(images.length);

  }


}
