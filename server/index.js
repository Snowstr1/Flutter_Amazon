const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://amarbat1001:mongoDB2025@cluster0.ptulnnl.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

mongoose.connect(DB).then(() => {
    console.log('Connection successful');
}).catch((e) => {
    console.log(e);
})
app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected to port ${PORT}`);
});
