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
    res.render("M2/updatePD", {
      message: ""
    });
  },

  updatePD: (req, res) => {
    let orderID = req.body.orderID;
    let payment_no = req.body.payment_no;
    let payment_date = req.body.payment_date;
    let payment_time = req.body.payment_time;
    let penalty = req.body.penalty;
    let amount_paid = req.body.amount_paid;

    let querySearch = `SELECT * FROM orders WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (results.length < 1) {
          message = "OrderID does not exist!";
          // res.render('.ejs', {
          //     message
          //     title: "Update Order Detail"
          // })
          console.log("OrderID does not exist!");
        } else {
          let queryUpdate = `
                    UPDATE payment_details 
                    SET payment_no =  ${payment_no}, 
                        payment_date =  ${payment_date}, 
                        payment_time = ${payment_time}, 
                        penalty = ${penalty}, 
                        amount_paid = ${amount_paid}, 
                    WHERE orderID = ${orderID};`;

          db.query(queryUpdate, function(error, results, fields) {
            if (error) {
              res.send({
                code: 400,
                failed: "an error ocurred"
              });
            } else {
              message = "Order Detail successfully updated!";
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
          json[0].payment_date = json[0].payment_date.split('T')[0]
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
  }
};
