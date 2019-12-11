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

          db.query(
            queryAdd,
            function(error, results, fields) {
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
            }
          );
        } else {
              res.render("M2/addPD", {
                message: "OrderID does not exist!",
                title: "Add Payment Detail"
              });
        }
      }
    });
  },
};
