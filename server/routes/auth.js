const express=require("express");
const bcryptjs=require("bcryptjs");
const jwt=require("jsonwebtoken");

const auth=require("../middlewares/auth")
const userModel=require("../models/user");
const bcrypt = require("bcryptjs/dist/bcrypt");

const authRouter=express.Router();
authRouter.post("/api/signup",async (req,res)=>{

  try{  
    const {name,email,password}=req.body;
   const alreadyEmailExist=await userModel.findOne({email});
   if(alreadyEmailExist){
    console.log(req.body);
    console.log("Already exist");
   return res.status(400).
   json({msg:"Email already exist for user"});
   }
   
   const passwordHashed=await bcrypt.hash(password,8);
   let user= new userModel({
    name,
    email,
    password:passwordHashed
})

   user=await user.save();
   console.log("Saved")
   res.json(user);
}
catch(e){
res.status(500).json({error:e.message})
};
});

authRouter.post("/api/signin",async (req,res)=>{
try{
  const {email,password}=req.body;
  const user=await userModel.findOne({email});
  if(!user){
   return res.status(400).json({msg:"User email unknown"});
  }
  const passwordCheck=bcrypt.compare(password,user.password);
  if(!passwordCheck){
    return res
    .status(400)
    .json({msg:"Password is incorrect"});
  }

  const token=  jwt.sign({id:user._id},"tokenPassword")
  res.json({ token, ...user._doc});
  //console.log(user.name);

}
  
catch(e){

return res.status(500).json({msg:e.message})
  }
})

authRouter.post("/verify_token",async (req,res)=>{
try{
  const token=req.header("tokenId");

  if(!token)res.json(false);

  const tokenCheckVerify=jwt.verify(token,'tokenPassword')
  if(!tokenCheckVerify)res.json(false);

  const user=await userModel.findById(tokenCheckVerify.id);
  console.log(`${user} details`);
  if(!user)res.json(false);
  res.json(true)
}
catch(e){
res.status(500).json({error:e.message});
}
})

authRouter.get("/",auth,async(req,res)=>{
  //console.log(req.user);

  const user=await userModel.findById(req.user);
 // console.log(user)
  res.json({...user._doc,token:req.token});
})

module.exports=authRouter;