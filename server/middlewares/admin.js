const jwt=require("jsonwebtoken");

const userModel=require("../models/user");

const admin=async (req,res,next)=>{
     try{
        //console.log("hi");
        const token=req.header("tokenId");
        if(!token)res.status(401).json({
            msg:"No auth token, access denied"
        })

        const tokenCheckVerify=jwt.verify(token,'tokenPassword')
        if(!tokenCheckVerify)res.status(401).json({
            msg:"Token verification failed, auhorization denied"
        });
        
        const user=await userModel.findById(tokenCheckVerify.id);
        //console.log(user.type);

        if(user.type=="user" || user.type=="seller"){
            res.status(401).json({msg:"You are not admin!"})
        }

        req.user=tokenCheckVerify.id;
        req.token=token;
        next();
    }
    catch(e){
        res.status(500).json({error:e.message})
    }
}

module.exports=admin;