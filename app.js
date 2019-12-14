const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");

const app = express();
const port = 8000;

const { home, M1, M2 } = require("./routes/index");

const {
  addOrderPage,
  createOrder,
  updateOrderPage,
  updateOrder,
  updateOrderResult,
  updateOrderDetails,
  searchOrderPage,
  searchOrder,
  reportOrderPage,
  reportOrder
} = require("./routes/orders");

const {
  addPDPage,
  createPD,
  searchPD,
  searchPDPage,
  updatePDPage,
  updatePDDetails,
  updatePDResult,
  updatePD,
  reportPDPage,
  reportPD
} = require("./routes/paymentDetails");

const {
  addResPage,
  createRes,
  searchResPage,
  searchRes,
  updateResPage,
  updateResDetails,
  updateResResult,
  updateRes,
  reportResPage,
  reportRes
} = require("./routes/residents");

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "p@ssword",
  database: "villagebayanihan",
  port: 3307
});

db.connect(err => {
  if (err) {
    throw err;
  }
  console.log("DB Connected!");
});

global.db = db;

app.set("port", process.env.port || port);
app.set("view engine", "ejs");
app.set("views", __dirname + "/views");

app.use(express.static(__dirname + "/views"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//App routes
app.get("/", home);
app.get("/ordersAdd", addOrderPage);
app.get("/ordersSearch", searchOrderPage);
app.get("/ordersUpdate", updateOrderPage);
app.get("/ordersUpdate/:orderID", updateOrderDetails);
// app.get("/M1/ordersDelete", deleteOrderPage);
app.get("/ordersReport", reportOrderPage);
app.post("/ordersAdd", createOrder);
app.post("/ordersSearch", searchOrder);
app.post("/ordersUpdate", updateOrderResult);
app.post("/ordersUpdate/:orderID", updateOrder);
app.post("/ordersReport", reportOrder);

//M1 Routes
app.get("/M1", M1);
app.get("/M1/addRes", addResPage);
app.get("/M1/searchRes", searchResPage);
app.get("/M1/updateRes", updateResPage);
app.get("/M1/updateRes/:resID", updateResDetails);
// app.get("/M1/deleteOD", deleteODPage);
app.get("/M1/reportRes", reportResPage);
app.post("/M1/addRes", createRes);
app.post("/M1/searchRes", searchRes);
app.post("/M1/updateRes", updateResResult);
app.post("/M1/updateRes/:resID", updateRes);
app.post("/M1/reportRes", reportRes);

//M2 Routes
app.get("/M2", M2);
app.get("/M2/addPD", addPDPage);
app.get("/M2/updatePD", updatePDPage);
app.get("/M2/updatePD/:pdID", updatePDDetails);
app.get("/M2/searchPD", searchPDPage);
app.get("/M2/reportPD", reportPDPage);
// app.get("/M2/deletePD", deletePDPage);
// app.get("/M2/reportPD", reportPDPage);
app.post("/M2/addPD", createPD);
app.post("/M2/searchPD", searchPD);
app.post("/M2/updatePD", updatePDResult);
app.post("/M2/updatePD/:pdID", updatePD);
app.post("/M2/reportPD", reportPD);

app.listen(port, () => {
  console.log("Port Connected!");
  console.log(`Link: http://localhost:${port}`);
});
