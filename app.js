const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");

const app = express();
const port = 8000;

const { home, M1, M2 } = require("./routes/index");
const {
  addOrderPage,
  createOrder,
  updateOrder,
  updateOrderPage,
  searchOrder,
  searchOrderPage
} = require("./routes/orders");
const { addODPage } = require("./routes/orderDetails");
const { addPDPage } = require("./routes/paymentDetails");
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
// app.get("/ordersUpdate", updateOrderPage);
// app.get("/ordersReport", reportOrderPage);

app.get("/M1", M1);
app.get("/M1/addOD", addODPage);
// app.get("/M1/updateOD", updateODPage);
// app.get("/M1/searchOD", searchODPage);
// app.get("/M1/deleteOD", deleteODPage);
// app.get("/M1/reportOD", reportODPage);

app.get("/M2", M2);
app.get("/M2/addPD", addPDPage);
// app.get("/M2/updatePD", updatePDPage);
// app.get("/M2/searchPD", searchPDPage);
// app.get("/M2/deletePD", deletePDPage);
// app.get("/M2/reportPD", reportPDPage);

app.post("/ordersAdd", createOrder);

app.listen(port, () => {
  console.log("Port Connected!");
  console.log(`Link: http://localhost:${port}`);
});
