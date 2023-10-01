const mongoose=require("mongoose");

const ProductSchema=mongoose.Schema({

    name:{
        type:String,
        required:true,
        trim:true

    },
    category:{
    type:String,
    trim:true,
    required:true,


    },
    description:{
        type:String,
        required :true
    
    },
    price:{
        type:Number,
        required:true
    },
    images:[
        {
            type:String,
            required:true

        }
    ],
    quantity:{
        type:Number,
        required:true,
    
    }
    
})

const productModel=mongoose.model("products", ProductSchema);
module.exports={productModel,ProductSchema};