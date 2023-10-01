const mongoose=require("mongoose");

const userSchema=mongoose.Schema({
    name:{
        type:String,
        trim:true,
        required:true,
    },
    
    email:{
        type:String,
        trim:true,
        required:true,
        validate:{
            validator:(value)=>{
                const re=/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
               
            },
            message:"Please enter a valid email address",
        }
    },
     
    password:{
        type:String,
        required:true,
        validate:{
            validator:(value)=>{
                return value.length>=6;
            },
            message:"Please password length of 6 or more required",
        }
    },

    address:{
        type:String,
        default:"",
    },

    type:{
        type:String,
        default:"admin",

    }


   
}
)

const userModel=mongoose.model("User",userSchema);
module.exports=userModel;
