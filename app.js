const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");

const app = express();
const port = 8000;

const { home } = require("./routes/index");
const orders = require("./routes/orders");
const orderDetails = require("./routes/orderDetails");
const paymentDetails = require("./routes/paymentDetails");

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

app.get("/", home);

app.get("/ordersAdd", orders.addOrderPage);
app.post("/ordersAdd", orders.createOrder);
// app.get("/ordersUpdate", orders.updateOrderPage);
// app.post("/ordersUpdate", orders.updateOrder);
// app.get("/ordersSearch", orders.searchOrderPage);
// app.post("/ordersSearch", orders.searchOrder);

app.get("/orderDetails", orderDetails.orderDetailsPage);
// app.get("/ordersDetailsAdd", orders.addOrderDetailsPage)
// app.post("/ordersDetailsAdd", orders.createOrderDetails);
// app.get("/ordersDetailsUpdate", orders.updateOrderDetailsPage)
// app.post("/ordersDetailsUpdate", orders.updateOrderDetails);
// app.get("/ordersDetailsSearch", orders.searchOrderDetailsPage)
// app.post("/ordersDetailsSearch", orders.searchOrderDetails);

app.get("/paymentDetails", paymentDetails.paymentDetailsPage);


app.listen(port, () => {
  console.log("Port Connected!");
  console.log(`Link: http://localhost:${port}`);
});
