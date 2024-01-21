const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const PORT = process.env.PORT || 3000;
const app = express();

<<<<<<< HEAD
const DB = "mongodb+srv://user1:test123@cluster0.bekbbhb.mongodb.net/?retryWrites=true&w=majority";
=======
const DB = "";

>>>>>>> fed49b069c45c85e3c0ab91b01ce721103919dbe
mongoose.connect(DB, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("MongoDB is Connected"))
  .catch((error) => {
    console.error(`MongoDB connection error: ${error}`);
  });

app.use(express.json());
app.use(authRouter);

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is listening on port ${PORT}`);
});
