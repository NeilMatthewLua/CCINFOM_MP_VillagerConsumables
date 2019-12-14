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
    res.render("GL/updateOrder", {
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
          json[0].order_date = json[0].order_date.split("T")[0];
          json[0].cancel_date = (json[0].cancel_date == null
            ? null
            : json[0].cancel_date.split("T")[0]);
          res.render("GL/displayUpdateOrder", {
            title: "Update Order",
            message: "Update Order",
            found: true,
            order: json[0]
          });
        }
      }
    });
  },

  updateOrderDetails: (req, res) => {
    let orderID = req.query.orderID;
    let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;
    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.render("GL/updateOrder", {
          title: "Update Order",
          message: "Invalid Input. Please double check."
        });
      } else {
        var string = JSON.stringify(results);
        var json = JSON.parse(string);
        json[0].order_date = json[0].order_date.split("T")[0];
        json[0].cancel_date == null ? null : json[0].cancel_date.split("T")[0];
        res.render("GL/displayUpdateConfirm.ejs", {
          title: "Update Order",
          message: "Update Order",
          found: true,
          order: json[0]
        });
      }
    });
  },

  updateOrder: (req, res) => {
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
    let remark = req.body.remark == "" ? "NULL" : "'" + req.body.remark + "'";
    let location = req.body.location;
    let timeliness = req.body.timeliness;
    let politeness = req.body.politeness;
    let cust_satisfaction = req.body.cust_satisfaction;
    let total_rating = req.body.total_rating;
    let supplier_email = req.body.supplier_email;
    let resident_email = req.body.resident_email;
    let resegroup_ID =
      req.body.resegroup_ID == "" ? "NULL" : req.body.resegroup_ID;

    let queryUpdate = `
                    UPDATE orders 
                    SET order_date =  '${order_date}', 
                        payment_type =  '${payment_type}', 
                        status = '${status}', 
                        cancelled_by = ${cancelled_by}, 
                        cancel_date = ${cancel_date}, 
                        cancel_reason = ${cancel_reason},  
                        location = '${location}', 
                        remark =${remark},
                        timeliness = '${timeliness}', 
                        politeness = '${politeness}', 
                        cust_satisfaction = '${cust_satisfaction}', 
                        total_rating = '${total_rating}', 
                        supplier_email = '${supplier_email}', 
                        resident_email = '${resident_email}', 
                        resegroup_ID = ${resegroup_ID}
                    WHERE orderID = ${orderID};`;

    db.query(queryUpdate, function(err, results, fields) {
      let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;
      var json;
      db.query(querySearch, function(error, results, fields) {
        var string = JSON.stringify(results);
        json = JSON.parse(string);
        json[0].order_date = json[0].order_date.split("T")[0];
        json[0].cancel_date == null ? null : json[0].cancel_date.split("T")[0];
        if (err) {
          console.log(err);
          res.render("GL/displayUpdateConfirm", {
            title: "Update Order",
            message: "Error in Updating. Please check input.",
            found: true,
            order: json[0]
          });
        } else {
          res.render("GL/displayUpdateConfirm", {
            title: "Update Order",
            message: "Order updated successfully",
            found: true,
            order: json[0]
          });
        }
      });
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
          json[0].order_date = json[0].order_date.split("T")[0];
          json[0].cancel_date == null
            ? null
            : json[0].cancel_date.split("T")[0];
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
  },
  reportOrderPage: (req, res) => {
    res.render("GL/genRepMonthly", {
      title: "Monthly Report Generation",
      message: "Monthly Report Generation"
    });
  },

  reportOrder: (req, res) => {
    let order_year = req.body.order_year;

    let querySearch = `SELECT		A.MONTH AS MONTH, A.NUM_COMPLETED AS NUM_COMPLETED, B.NUM_CANCELLED AS NUM_CANCELLED, C.TOTAL_SALES AS TOTAL_SALES
    FROM		(	SELECT		MONTH(o.order_date) AS MONTH ,COUNT(o.status) AS NUM_COMPLETED
            FROM 		orders o
            WHERE		o.status = 'D' AND YEAR(o.order_date) = '${order_year}'
            ORDER BY 	o.status, MONTH(o.order_date)
          ) A LEFT JOIN (		SELECT		MONTH(o.order_date)	AS MONTH ,COUNT(o.status)	AS NUM_CANCELLED
                    FROM 		orders o
                    WHERE		o.status = 'C' AND YEAR(o.order_date) = '${order_year}'
                    ORDER BY 	o.status, MONTH(o.order_date) ) B	ON A.MONTH = B.MONTH
            LEFT JOIN (     SELECT		MONTH(o.order_date)	AS MONTH, SUM(pd.amount_paid)	AS TOTAL_SALES
                    FROM 		orders o
                      JOIN		payment_details pd
                      ON 			pd.orderID = o.orderID
                    WHERE		o.status = 'C'AND YEAR(o.order_date) = '${order_year}'
                    ORDER BY 	o.status, MONTH(o.order_date) ) C ON B.MONTH = C.MONTH;`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (results.length > 0 && results[0].MONTH != null) {
          message = "";
          res.render("GL/displayReportOrder", {
            message,
            title: "Monthly Order Report",
            message: `Monthly Order Report for Year ${order_year}`,
            results: results
          });
        } else {
          message = "No Results!";
          res.render("GL/displayReportOrder", {
            message,
            title: "Order Order Report",
            results: ""
          });
        }
      }
    });
  }
};
