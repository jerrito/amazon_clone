const express=require("express");
const mongoose=require('mongoose');

//local files import
const authRouter=require("./routes/auth");
const adminRouter=require("./routes/admin");

const app=express();
const port=4000;
const DatabaseUrl="mongodb+srv://jerrito0240:streak0240845898@cluster0.4g2mt9z.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);
app.use(adminRouter); 

mongoose.connect(DatabaseUrl).then(()=>{
    console.log("Connection success");
}).catch((e)=>{
    console.log(e);
})
app.get("/",(req,res)=>{

res.status(200).send("<h1>Home Page</h1>");
}
);

// app.get("*",(req,res)=>{

// res.status(404).send("Page not found");
// });

app.listen(port,"0.0.0.0",()=>{
console.log(`server is listening at port ${port}`)});