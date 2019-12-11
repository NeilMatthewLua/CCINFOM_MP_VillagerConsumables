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
    let cancelled_by = req.body.cancelled_by;
    let cancel_date = req.body.cancel_date;
    let cancel_reason = req.body.cancel_reason;
    let location = req.body.location;
    let timeliness = req.body.timeliness;
    let politeness = req.body.politeness;
    let cust_satisfaction = req.body.cust_satisfaction;
    let total_rating = req.body.total_rating;
    let supplier_email = req.body.supplier_email;
    let resident_email = req.body.resident_email;
    let resegroup_ID = req.body.resegroup_ID;

    let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
          res.render("GL/addOrder", {
            message: "Invalid Input. Please double check."
          })
      } else {
        if (results.length > 0) {
          res.render("addOrder.ejs", {
            message: "OrderID already exists!"
          });
          console.log("OderID already exists");
        } else {
          let queryAdd = `
                    INSERT INTO orders (orderID, order_date, payment_type, status, cancelled_by, cancel_date, cancel_reason, location, timeliness, politeness, cust_satisfaction, total_rating, supplier_email, resident_email, resegroup_ID) 
                    VALUES ( 
                        ${orderID}, 
                        '${order_date}', 
                        '${payment_type}', 
                        '${status}', 
                        '${cancelled_by}', 
                        '${cancel_date}', 
                        '${cancel_reason}', 
                        '${location}', 
                        ${timeliness}, 
                        ${politeness}, 
                        ${cust_satisfaction}, 
                        ${total_rating},
                        '${supplier_email}', 
                        '${resident_email}', 
                        ${resegroup_ID}
                    );`;

          db.query(
            queryAdd,
            function(error, results, fields) {
              if (error) {
                res.render("GL/addOrder", {
                  message: "Invalid Input. Please double check your input.",
                  title: "Add Order"
                })
              } else {
                message = "Order successfully added!";
                res.render("GL/addOrder", {
                  message,
                  title: "Add Order"
                });
              }
            }
          );
        }
      }
    });
  },

  updateOrderPage: (req, res) => {
    res.render("GL/updateOrder", {
      message: ""
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
    let location = req.body.location;
    let timeliness = req.body.timeliness;
    let politeness = req.body.politeness;
    let cust_satisfaction = req.body.cust_satisfaction;
    let total_rating = req.body.total_rating;
    let supplier_email = req.body.supplier_email;
    let resident_email = req.body.resident_email;
    let resegroup_ID = req.body.resegroup_ID;

    let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
          res.render("GL/updateOrder", {
            message: "Invalid Input. Please double check."
          })
      } else {
        if (results.length < 1) {
          message = "OrderID does not exist!";
          // res.render('.ejs', {
          //     message
          //     title: "Update Order"
          // })
          console.log("OrderID does not exist!");
        } else {
          let queryUpdate = `
                    UPDATE orders 
                    SET order_date =  ${order_date}, 
                        payment_type =  ${payment_type}, 
                        status = ${status}, 
                        cancelled_by = ${cancelled_by}, 
                        cancel_date = ${cancel_date}, 
                        cancel_reason = ${cancel_reason}, 
                        location = ${location}, 
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
              res.send({
                code: 400,
                failed: "error ocurred"
              });
            } else {
              message = "Order successfully updated!";
              // res.render('.ejs', {
              //     message
              //     title: Update Order
              // })
              console.log(message);
            }
          });
        }
      }
    });
  },

  searchOrderPage: (req, res) => {
    res.render("GL/searchOrder.ejs", {
      message: ""
    });
  },

  searchOrder: (req, res) => {
    let orderID = req.body.orderID;

    let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
          res.render("GL/searchOrder", {
            message: "Invalid Input. Please double check."
          })
      } else {
        if (reults.length > 0) {
          message = "Cool";
          // res.render('.ejs',{
          //     message
          //      results: resutls
          // })
          console.log(message);
        } else {
          message = "OrderID does not exist!";
          // res.render('.ejs',{
          //     message
          //      results: resutls
          // })
          console.log("OrderID does not exist!");
        }
      }
    });
  }
};
