import mongoose from "mongoose"


interface TodoI {
  taskName: string;
  taskDate: Date;
  taskTime: Date;
  taskReminder: boolean;
  markAsDone: boolean;
}

interface TodoDocument extends mongoose.Document {
    taskName: string;
    taskDate: Date;
    taskTime: Date;
    taskReminder: boolean;
    markAsDone: boolean;
}

const todoSchema = new mongoose.Schema({
  taskName: {
    type: String,
    required: true,
  },
  taskDate: {
    type: Date,
    required: true,
  },
  taskTime: {
    type: Date,
    required: true,
  },
  taskReminder: {
    type: Boolean,
    required: false,
  },
  markAsDone: {
    type: Boolean,
    required: false,
  },
});

interface todoModelInterface extends mongoose.Model<TodoDocument> {
  set(x: TodoI): TodoDocument;
}

todoSchema.statics.set = (x: TodoI) => {
  return new Todo(x);
};

const Todo = mongoose.model<TodoDocument, todoModelInterface>(
  "Todo",
  todoSchema
);

Todo.set({
  taskName: "First Task",
  taskDate: new Date(),
  taskTime: new Date(),
  taskReminder: false,
  markAsDone: false

});

export { Todo };