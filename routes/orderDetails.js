module.exports = {
  addODPage: (req, res) => {
    res.render("M1/addOD", {
      title: "Add Order Detail",
      message: "Add Order Detail"
    });
  },

  createOD: (req, res) => {
    let orderID = req.body.orderID;
    let quantity_ordered = req.body.quantity_ordered;
    let price_each = req.body.price_each;
    let product_quality = req.body.product_quality;
    let prodID = req.body.prodID;

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
                    INSERT INTO order_details (orderID, quantity_ordered, price_each, product_quality, prodID) 
                    VALUES ( 
                        ${orderID}, 
                        ${quantity_ordered}, 
                        ${price_each}, 
                        ${product_quality}, 
                        ${prodID}
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
                message = "Order Detail successfully added!";
                res.render("M1/addOD", {
                  message,
                  title: "Add Order Detail"
                });
                console.log(message);
              }
            }
          );
        } else {
              res.render("M1/addOD", {
                message: "OrderID does not exist!",
                title: "Add Order Detail"
              });
        }
      }
    });
  },

  updateODPage: (req, res) => {
    res.render("M1/updateOD", {
      message: ""
    });
  },

  updateOrder: (req, res) => {
    let orderID = req.body.orderID;
    let quantity_ordered = req.body.quantity_ordered;
    let price_each = req.body.price_each;
    let product_quality = req.body.product_quality;
    let prodID = req.body.prodID;

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
                    UPDATE order_details 
                    SET quantity_ordered =  ${quantity_ordered}, 
                        price_each =  ${price_each}, 
                        product_quality = ${product_quality}, 
                        prodID = ${prodID}, 
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

  searchOD: (req, res) => {
    res.render("M1/searchOD", {
      message: ""
    });
  },

  searchPD: (req, res) => {
    let orderID = req.body.orderID;

    let querySearch = `SELECT * FROM order_details WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (reults.length > 0) {
          message = "";
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

  deleteOD: (req, res) => {
    res.render("M1/deleteOD", {
      message: ""
    });
  },
  
  deleteOD: (req, res) => {
    let orderID = req.body.orderID;

    let querySearch = `DELETE FROM order_details WHERE orderID = '${orderID}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (reults.length > 0) {
          message = "Order Detail successfully deleted!";
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
