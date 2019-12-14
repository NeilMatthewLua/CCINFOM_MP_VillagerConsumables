module.exports = {
  addPDPage: (req, res) => {
    res.render("M2/addPD", {
      title: "Add Payment Detail",
      message: "Add Payment Detail"
    });
  },

  createPD: (req, res) => {
    let orderID = req.body.orderID;
    let payment_no = req.body.payment_no;
    let payment_date = req.body.payment_date;
    let payment_time = req.body.payment_time;
    let penalty = req.body.penalty == "" ? 0 : req.body.penalty;
    let amount_paid = req.body.amount_paid;

    let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (results.length > 0) {
          let queryAdd = `
                    INSERT INTO payment_details (orderID, payment_no, payment_date, payment_time, penalty, amount_paid) 
                    VALUES ( 
                        ${orderID}, 
                        ${payment_no}, 
                        '${payment_date}', 
                        '${payment_time}', 
                        ${penalty}, 
                        ${amount_paid}
                    );`;

          db.query(queryAdd, function(error, results, fields) {
            if (error) {
              res.send({
                code: 400,
                failed: "error ocurred"
              });
            } else {
              message = "Payment Detail successfully added!";
              res.render("M2/addPD", {
                message,
                title: "Add Payment Detail"
              });
              console.log(message);
            }
          });
        } else {
          res.render("M2/addPD", {
            message: "OrderID does not exist!",
            title: "Add Payment Detail"
          });
        }
      }
    });
  },

  updatePDPage: (req, res) => {
    res.render("M2/updatePD.ejs", {
      message: "Update Payment Details",
      title: "Update Payment Details"
    });
  },

  updatePDResult: (req, res) => {
    let payment_no = req.body.payment_no;
    let querySearch = `SELECT * FROM payment_details WHERE payment_no = ${payment_no}`;
    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.render("M2/updatePD", {
          title: "Update Payment Details",
          message: "Invalid Input. Please double check."
        });
      } else {
        if (results.length < 1) {
          res.render("M2/updatePD", {
            title: "Update Payment Details",
            message: "Payment No. does not exist!"
          });
        } else {
          var string = JSON.stringify(results);
          var json = JSON.parse(string);
          json[0].payment_date = json[0].payment_date.split("T")[0];
          res.render("M2/displayUpdatePD", {
            title: "Update Payment Details",
            message: "Update Payment Details",
            found: true,
            payment: json[0]
          });
        }
      }
    });
  },

  updatePDDetails: (req, res) => {
    let payment_no = req.query.payment_no;
    let querySearch = `SELECT * FROM payment_details WHERE payment_no = ${payment_no}`;
    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.render("M2/updatePD", {
          title: "Update Payment Details",
          message: "Invalid Input. Please double check."
        });
      } else {
        var string = JSON.stringify(results);
        var json = JSON.parse(string);
        json[0].payment_date = json[0].payment_date.split("T")[0];
        res.render("M2/displayUpdateConfirm", {
          title: "Update Payment Details",
          message: "Update Payment Details",
          found: true,
          payment: json[0]
        });
      }
    });
  },

  updatePD: (req, res) => {
    let payment_no = req.body.payment_no;
    let payment_date = req.body.payment_date;
    let payment_time = req.body.payment_time;
    let penalty = req.body.penalty == "" ? 0 : req.body.penalty;
    let amount_paid = req.body.amount_paid;

    let queryUpdate = `
                    UPDATE payment_details 
                    SET payment_no =  ${payment_no}, 
                        payment_date =  '${payment_date}', 
                        payment_time = '${payment_time}', 
                        penalty = ${penalty}, 
                        amount_paid = ${amount_paid} 
                    WHERE payment_no = ${payment_no};`;

    db.query(queryUpdate, function(err, results, fields) {
      let querySearch = `SELECT * FROM payment_details WHERE payment_no = ${payment_no}`;
      var json;
      db.query(querySearch, function(error, results, fields) {
        var string = JSON.stringify(results);
        json = JSON.parse(string);
        json[0].payment_date = json[0].payment_date.split("T")[0];
        if (err) {
          console.log(err);
          res.render("M2/displayUpdateConfirm.ejs", {
            title: "Update Payment Detail",
            message: "Error in Updating. Please check input.",
            found: true,
            payment: json[0]
          });
        } else {
          res.render("M2/displayUpdateConfirm.ejs", {
            title: "Update Payment Detail",
            message: "Payment Detail updated successfully",
            found: true,
            payment: json[0]
          });
        }
      });
    });
  },

  searchPDPage: (req, res) => {
    res.render("M2/searchPD", {
      message: "Search Payment Detail",
      title: "Search Payment Detail"
    });
  },

  searchPD: (req, res) => {
    let payment_no = req.body.payment_no;

    let querySearch = `SELECT * FROM payment_details WHERE payment_no = '${payment_no}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (results.length > 0) {
          var string = JSON.stringify(results);
          var json = JSON.parse(string);
          json[0].payment_date = json[0].payment_date.split("T")[0];
          res.render("M2/displayPD.ejs", {
            title: "Payment Details",
            message: "Search Payment Details",
            found: true,
            payment: json[0]
          });
        } else {
          res.render("M2/displayPD.ejs", {
            title: "Payment Details",
            message: "Payment Detail does not exist!",
            found: false
          });
        }
      }
    });
  },

  deletePDPage: (req, res) => {
    res.render("M2/deletePD", {
      message: ""
    });
  },

  deletePD: (req, res) => {
    let orderID = req.body.orderID;

    let querySearch = `DELETE FROM payment_details WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (results.length > 0) {
          message = "Payment Detail successfully deleted!";
          // res.render('.ejs', {
          //     message
          //     results: results
          // })
          console.log(message);
        } else {
          message = "OrderID does not exist!";
          // res.render('.ejs', {
          //     message
          //     results: results
          // })
          console.log("OrderID does not exist!");
        }
      }
    });
  },

  reportPDPage: (req, res) => {
    res.render("M2/genRepResi", {
      title: "Monthly Average Rating Report Generation",
      message: "Monthly Average Rating Report Generation"
    });
  },

  reportPD: (req, res) => {
    let order_year = req.body.order_year;

    let querySearch = `SELECT 		MONTH(o.order_date) AS Month, ROUND(AVG(o.timeliness),2) AS Timeliness, ROUND(AVG(o.politeness),2) AS Politeness, ROUND(AVG(o.cust_satisfaction),2) AS Cust_Satisfaction, ROUND(AVG(total_rating),2) AS Total_Rating
    FROM		orders o
    WHERE		o.status = 'C'AND YEAR(o.order_date) = '${order_year}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if(results.length > 0 && results[0].Month != null) {
          message = `Rating Report for Year ${order_year}`;    
          res.render('M2/displayReportPD', {
              message,
              title: "Monthly Average Rating Report Generation",
              message : `Monthly Average Rating Report for Week ${order_year}`,  
              results: results
          })
        } else {
          message = "No Results!";
          res.render('M2/displayReportPD', {
              message,
              title: "Monthly Average Rating Report Generation",
              results: ""
          })
        }
      }
    });
  }
};
