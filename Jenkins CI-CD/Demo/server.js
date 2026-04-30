import express from "express";
import sum from "./sum.js"

const app = express();

const port = 8000;

app.listen(port, () =>{
    console.log(`Server is listening at port ${port}`);   
});

app.get("/home", async(req,res)=>{
    res.json({
        msg: "I am root!"
    });
})

app.get("/getSum/:a/:b", async(req , res) =>{
    const {a,b} = req.params;

    res.json({
        ans: sum(parseInt(a),parseInt(b))
    });

})