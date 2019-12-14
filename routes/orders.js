module.exports = {
  addOrderPage: (req, res) => {
    res.render("GL/addOrder", {
      title: "Add Order",
      message: "Add Order"
    });
  },

  createOrder: (req, res) => {
    let orderID = req.body.orderID;
    let order_date = req.body.order_date;
    let payment_type = req.body.payment_type;
    let status = req.body.status;
    let cancelled_by =
      req.body.cancelled_by == "" ? "NULL" : "'" + req.body.cancelled_by + "'";
    let cancel_date =
      req.body.cancel_date == "" ? "NULL" : "'" + req.body.cancel_date + "'";
    let cancel_reason =
      req.body.cancel_reason == ""
        ? "NULL"
        : "'" + req.body.cancel_reason + "'";
    let location = req.body.location;
    let remark = req.body.remark == "" ? "NULL" : "'" + req.body.remark + "'";
    let timeliness = req.body.timeliness;
    let politeness = req.body.politeness;
    let cust_satisfaction = req.body.cust_satisfaction;
    let total_rating = req.body.total_rating;
    let supplier_email = req.body.supplier_email;
    let resident_email = req.body.resident_email;
    let resegroup_ID =
      req.body.resegroup_ID == "" ? "NULL" : req.body.resegroup_ID;

    let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.render("GL/addOrder", {
          title: "Add Order",
          message: "Invalid Input. Please double check."
        });
      } else {
        if (results.length > 0) {
          res.render("GL/addOrder.ejs", {
            title: "Add Order",
            message: "OrderID already exists!"
          });
        } else {
          let queryAdd = `
          INSERT INTO orders (orderID, order_date, payment_type, status, cancelled_by, cancel_date, cancel_reason, location, remark,timeliness, politeness, cust_satisfaction, total_rating, supplier_email, resident_email, resegroup_ID)  
                    VALUES ( 
                        ${orderID}, 
                        '${order_date}', 
                        '${payment_type}', 
                        '${status}', 
                        ${cancelled_by}, 
                        ${cancel_date}, 
                        ${cancel_reason}, 
                        '${location}',
                        ${remark}, 
                        '${location}', 
                        ${timeliness}, 
                        ${politeness}, 
                        ${cust_satisfaction}, 
                        ${total_rating},
                        '${supplier_email}', 
                        '${resident_email}', 
                        ${resegroup_ID}
                    );`;

          db.query(queryAdd, function(error, results, fields) {
            if (error) {
              res.render("GL/addOrder", {
                message: "Invalid Input. Please double check your input.",
                title: "Add Order"
              });
            } else {
              res.render("GL/addOrder", {
                message: "Order successfully Added!",
                title: "Add Order"
              });
              console.log(message);
            }
          });
        }
      }
    });
  },

  updateOrderPage: (req, res) => {
    res.render("GL/updateOrder.ejs", {
      message: "Update Order",
      title: "Update Order"
    });
  },

  updateOrderResult: (req, res) => {
    let orderID = req.body.orderID;
    let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;
    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.render("GL/updateOrder", {
          title: "Update Order",
          message: "Invalid Input. Please double check."
        });
      } else {
        if (results.length < 1) {
          res.render("GL/updateOrder.ejs", {
            title: "Update Order",
            message: "OrderID does not exist!"
          });
        } else {
          var string = JSON.stringify(results);
          var json = JSON.parse(string);
       
          res.render("GL/displayUpdateOrder.ejs", {
            title: "Update Order",
            message: "Update Order",
            found: true,
            order: json[0]
          });
        }
      }
    });
  },

  updateOrder: (req, res) => {
    let orderID = req.body.orderID;
    let order_date = req.body.order_date;
    let payment_type = req.body.payment_type;
    let status = req.body.status;
    let cancelled_by = req.body.cancelled_by;
    let cancel_date = req.body.cancel_date;
    let cancel_reason = req.body.cancel_reason;
    let remark = req.body.remark;
    let location = req.body.location;
    let timeliness = req.body.timeliness;
    let politeness = req.body.politeness;
    let cust_satisfaction = req.body.cust_satisfaction;
    let total_rating = req.body.total_rating;
    let supplier_email = req.body.supplier_email;
    let resident_email = req.body.resident_email;
    let resegroup_ID = req.body_resegroup_ID;

    let queryUpdate = `
                    UPDATE orders 
                    SET order_date =  ${order_date}, 
                        payment_type =  ${payment_type}, 
                        status = ${status}, 
                        cancelled_by = ${cancelled_by}, 
                        cancel_date = ${cancel_date}, 
                        cancel_reason = ${cancel_reason}, 
                        location = ${location}, 
                        remark = ${remark},
                        timeliness = ${timeliness}, 
                        politeness = ${politeness}, 
                        cust_satisfaction = ${cust_satisfaction}, 
                        total_rating = ${total_rating}, 
                        supplier_email = ${supplier_email}, 
                        resident_email = ${resident_email}, 
                        resegroup_ID = ${resegroup_ID}
                    WHERE orderID = ${orderID};`;

    db.query(queryUpdate, function(error, results, fields) {
      if (error) {
        res.render("GL/updateOrder", {
          title: "Update Order",
          message: "Invalid Input. Please double check.",
          found: true
        });
      } else {
        res.render("GL/updateOrder", {
          title: "Update Order",
          message: "Order successfully updated!",
          found: true
        });
        console.log(message);
      }
    });
  },

  searchOrderPage: (req, res) => {
    res.render("GL/searchOrder.ejs", {
      title: "Search Order",
      message: "Search Order"
    });
  },

  searchOrder: (req, res) => {
    let orderID = req.body.orderID;

    let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.render("GL/searchOrder.ejs", {
          title: "Search Order",
          message: "Invalid Input. Please double check."
        });
      } else {
        if (results.length > 0) {
          //Perform parsing to be able to access json
          var string = JSON.stringify(results);
          var json = JSON.parse(string);
          json[0].order_date = json[0].order_date.split('T')[0]
          res.render("GL/displayOrder.ejs", {
            title: "Search Order",
            message: "Search Order",
            order: json[0],
            found: true
          });
        } else {
          res.render("GL/displayOrder.ejs", {
            title: "Search Order",
            message: "OrderID does not exist!",
            found: false
          });
        }
      }
    });
  }
};
