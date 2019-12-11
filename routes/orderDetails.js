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
};
