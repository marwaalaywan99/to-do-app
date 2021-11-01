import express, {Request, Response} from "express";
import { Todo } from "../models/user_model";

const router = express.Router();

//Post Request
router.post("/add", async(req: Request, res: Response) => {
    const{taskName, taskDate, taskTime, taskReminder, markAsDone} = req.body;
    const dataItem = Todo.set({taskName, taskDate, taskTime, taskReminder, markAsDone});
    await dataItem.save();
    return res.status(200).json({
        data: dataItem
    })
});

//Get Request
router.get("/", async(req: Request, res:Response) =>{
    try{
        const dataItem = await Todo.find({});
        res.status(200).json({
            data: dataItem,
        })
    }
    catch(error){
        console.log(error);
    }
});

//Delete Request
router.delete("/delete", async(req: Request, res:Response) =>{
   const filter = {
       title: req.body.taskName,
   };
   const dataItem = await Todo.deleteOne(filter)
    .then((data) =>
        res.json({
            data:data,
        })
    )
    .catch((error) => {
        return res.send(error);
    });

});

//Update Request
router.put("/update", async (req: Request, res: Response) => {
    const filter = {
        title: req.body.taskName,
    };

    const updatedData = {
        taskName: req.body.taskName,
    };

    const dataItem = await Todo.updateOne(filter, updatedData, {
        new: true,
    })
    .then((data) =>
        res.json({
            data:data,
        })
    )
    .catch((error) => {
        return res.send(error);
    });
})

export {router};