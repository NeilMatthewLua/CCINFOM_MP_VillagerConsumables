module.exports = {

    //gets all orders
    getOrders : (req, res) => {
        db.query('SELECT * FROM orders', function( error, results, fields) {
            if(error) {
                res.send({
                    "code": 400,
                    "failed":"error ocurred",
                })
            }
            else {
                if(results.length > 0){
                    //TODO Display the results[]  rendering the dashboard EJS with the table
                }
                else{
                    //TODO Resend the page, with error message for 'No Results'
                }
            }
        });
    },

    //gets all orders that is shipped
    // TODO shipped or 'shipped'
    getOrdersShipped : (req, res) => {
        db.query('SELECT * FROM orders WHERE staus = shipped', function( error, results, fields) {
            if(error) {
                res.send({
                    "code": 400,
                    "failed":"error ocurred",
                })
            }
            else {
                if(results.length > 0){
                    //TODO Display the results[]  rendering the dashboard EJS with the table
                }
                else{
                    //TODO Resend the page, with error message for 'No Results'
                }
            }
        });
    },

    //gets all not shipped orders
    // TODO shipped or 'shipped'
    getOrdersNotShipped : (req, res) => {
        db.query('SELECT * FROM orders WHERE NOT staus = shipped', function( error, results, fields) {
            if(error) {
                res.send({
                    "code": 400,
                    "failed":"error ocurred",
                })
            }
            else {
                if(results.length > 0){
                    //TODO Display the results[]  rendering the dashboard EJS with the table
                }
                else{
                    //TODO Resend the page, with error message for 'No Results'
                }
            }
        });
    },

    //gets the order with the OrderID
    getOrdersID : (req, res) => {
        let orderID = req.body.orderID;
        
        db.query('SELECT * FROM orders WHERE orderID = ?', [orderID], function( error, results, fields) {
            if(error) {
                res.send({
                    "code": 400,
                    "failed":"error ocurred",
                })
            }
            else {
                if(results.length > 0){
                    //TODO Display the results[]  rendering the dashboard EJS with the table
                }
                else{
                    //TODO Resend the page, with error message for 'No Results'
                }
            }
        });
    },

    //gets the order with the SupplierID
    getOrdersSupplier : (req, res) => {
        let supplierID = req.body.supplierID;
        
        db.query('SELECT * FROM orders WHERE supplierID = ?', [supplierID], function( error, results, fields) {
            if(error) {
                res.send({
                    "code": 400,
                    "failed":"error ocurred",
                })
            }
            else {
                if(results.length > 0){
                    //TODO Display the results[] 
                }
                else{
                    //TODO Resend the page, with error message for 'No Results'
                }
            }
        });
    },
    
    //gets the order with the productID
    getOrdersProduct : (req, res) => {
        let productID = req.body.productID;
        
        db.query('SELECT * FROM orders WHERE supplierID = ?', [productID], function( error, results, fields) {
            if(error) {
                res.send({
                    "code": 400,
                    "failed":"error ocurred",
                })
            }
            else {
                if(results.length > 0){
                    //TODO Display the results[] 
                }
                else{
                    //TODO Resend the page, with error message for 'No Results'
                }
            }
        });
    },
    
    //deletes the order with the OrderID
    deleteOrderID : (req, res) => {
        let orderID = req.body.orderID;

        db.query('DELETE FROM orders WHERE orderID = ?', [orderID], function( error, results, fields) {
            if(error) {
                res.send({
                    "code": 400,
                    "failed":"error ocurred",
                })
            }
            else {
                if(results.length > 0){
                    //TODO Display the results[]  
                }
                else{
                    //TODO Resend the page, with error message for 'No Results'
                }
            }
        });
    },

    //deletes the order with the SupplierID    
    deleteOrderSupplier : (req, res) => {
        let supplierID = req.body.orderID;

        db.query('DELETE FROM orders WHERE supplierID = ?', [supplierID], function( error, results, fields) {
            if(error) {
                res.send({
                    "code": 400,
                    "failed":"error ocurred",
                })
            }
            else {
                if(results.length > 0){
                    //TODO Display the results[]  
                }
                else{
                    //TODO Resend the page, with error message for 'No Results'
                }
            }
        });
    },

    //deletes the order with the productID
    deleteOrderProduct : (req, res) => {
        let productID = req.body.orderID;

        db.query('DELETE FROM orders WHERE productID = ?', [productID], function( error, results, fields) {
            if(error) {
                res.send({
                    "code": 400,
                    "failed":"error ocurred",
                })
            }
            else {
                if(results.length > 0){
                    //TODO Display the results[]  
                }
                else{
                    //TODO Resend the page, with error message for 'No Results'
                }
            }
        });
    }
}