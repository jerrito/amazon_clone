const express=require("express")
const mongose=require("mongoose");
const admin=require("../middlewares/admin")
const {productModel}=require("../models/product")
const adminRoute=express.Router();

adminRoute.post("/admin/add-product",admin,async(req,res)=>{

    try{
        console.log("Hello");
    const {name,description,price,
        category,quantity,images}=req.body;
        //console.log(req.body);

        let product=new productModel({
            name,
            description,
            price,
        category,
        quantity,
        images
        });
        
    await product.save();
      //console.log(product);
      res.json(product);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
})

adminRoute.get("/admin/all-products",async(req, res)=>{

    try{
    const allProduct=await productModel.find({

     } );
    
    res.json(allProduct);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }

})

adminRoute.post("/admin/delete-product",admin,async(req,res)=>{


    try{
        const {id}= req.body;
     let  product= 
      await productModel.findByIdAndDelete(id);
       res.json(product);


    }
    catch(e){
        res.status(500).json({error:e.message});
    }
})

module.exports=adminRoute;