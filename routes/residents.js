module.exports = {
  addResPage: (req, res) => {
    res.render("M1/addRes", {
      title: "Add Resident",
      message: "Add Resident"
    });
  },

  createRes: (req, res) => {
    let resident_email = req.body.resident_email;
    let application_status = req.body.application_status;
    let user_email = req.body.user_email;
    let householdID = req.body.householdID;

    let querySearch = `SELECT * FROM residents WHERE resident_email = '${resident_email}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (results.length < 1) {
          let queryAdd = `
                    INSERT INTO residents (resident_email, application_status, user_email, householdID) 
                    VALUES ( 
                        '${resident_email}', 
                        '${application_status}', 
                        '${user_email}', 
                        ${householdID} 
                    );`;

          db.query(queryAdd, function(error, results, fields) {
            if (error) {
              res.send({
                code: 400,
                failed: "error ocurred"
              });
            } else {
              message = "Resident successfully added!";
              res.render("M1/addRes", {
                message,
                title: "Add Resident"
              });
            }
          });
        } else {
          res.render("M1/addRes", {
            message: "Resident email already exists!",
            title: "Add Resident"
          });
        }
      }
    });
  },

  updateResPage: (req, res) => {
    res.render("M1/updateRes.ejs", {
      message: "Update Resident",
      title: "Update Resident"
    });
  },

  updateResResult: (req, res) => {
    let resident_email = req.body.resident_email;
    let querySearch = `SELECT * FROM residents WHERE resident_email = '${resident_email}'`;
    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.render("M1/updateRes", {
          title: "Update Residents",
          message: "Invalid Input. Please double check."
        });
      } else {
        if (results.length < 1) {
          res.render("M1/updateRes", {
            title: "Update Order",
            message: "Resident Email does not exist!"
          });
        } else {
          var string = JSON.stringify(results);
          var json = JSON.parse(string);
          res.render("M1/displayUpdateRes", {
            title: "Update Order",
            message: "Update Order",
            found: true,
            resident: json[0]
          });
        }
      }
    });
  },

  updateResDetails: (req, res) => {
    let resident_email = req.query.resident_email;

    let querySearch = `SELECT * FROM residents WHERE resident_email = '${resident_email}'`;
    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.render("M1/updateRes", {
          title: "Update Resident",
          message: "Invalid Input. Please double check."
        });
      } else {
        var string = JSON.stringify(results);
        var json = JSON.parse(string);
        res.render("M1/displayUpdateConfirm", {
          title: "Update Resident",
          message: "Update Resident",
          found: true,
          resident: json[0]
        });
      }
    });
  },

  updateRes: (req, res) => {
    let resident_email = req.body.resident_email;
    let application_status = req.body.application_status;
    let user_email = req.body.user_email;
    let householdID = req.body.householdID;

    let queryUpdate = `
                    UPDATE residents 
                    SET application_status =  '${application_status}', 
                    user_email =  '${user_email}', 
                    householdID = ${householdID} 
                    WHERE resident_email = '${resident_email}';`;
    db.query(queryUpdate, function(err, results, fields) {
      let querySearch = `SELECT * FROM residents WHERE resident_email = '${resident_email}'`;
      var json;
      db.query(querySearch, function(error, results, fields) {
        var string = JSON.stringify(results);
        json = JSON.parse(string);

        if (err) {
          console.log(err);
          res.render("M1/displayUpdateConfirm.ejs", {
            title: "Update Resident",
            message: "Error in Updating. Please check input.",
            found: true,
            resident: json[0]
          });
        } else {
          res.render("M1/displayUpdateConfirm.ejs", {
            title: "Update Resident",
            message: "Resident updated successfully",
            found: true,
            resident: json[0]
          });
        }
      });
    });
  },

  searchResPage: (req, res) => {
    res.render("M1/searchRes", {
      title: "Search Resident",
      message: "Search Resident"
    });
  },

  searchRes: (req, res) => {
    let resident_email = req.body.resident_email;

    let querySearch = `SELECT * FROM residents WHERE resident_email = '${resident_email}'`;

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
          res.render("M1/displayRes.ejs", {
            title: "Search Resident",
            message: "Search Resident",
            found: true,
            resident: json[0]
          });
        } else {
          res.render("M1/displayRes.ejs", {
            title: "Search Resident",
            message: "Resident Email not found.",
            found: false
          });
        }
      }
    });
  },

  deleteRes: (req, res) => {
    res.render("M1/deleteRes", {
      message: ""
    });
  },

  deleteRes: (req, res) => {
    let resident_email = req.body.resident_email;

    let querySearch = `DELETE FROM residents WHERE resident_email = '${resident_email}'`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (reults.length > 0) {
          message = "Resident successfully deleted!";
          // res.render('.ejs', {
          //     message
          //     results: results
          // })
          console.log(message);
        } else {
          message = "resident_email does not exist!";
          // res.render('.ejs', {
          //     message
          //     results: results
          // })
          console.log("resident_email does not exist!");
        }
      }
    });
  },
  
  reportResPage: (req, res) => {
    res.render("M1/genRepDaily", {
      title: "Daily Report Generation",
      message: "Daily Report Generation"
    });
  },

  reportRes: (req, res) => {
    let order_month = req.body.order_month;
    let order_year = req.body.order_year;

    let querySearch = `SELECT  DAY(o.order_date) AS DAY, COUNT(o.orderID) AS TOTAL_COMPLETED_ORDER, SUM(pd.amount_paid) AS TOTAL_AMOUNT
    FROM	orders o
      JOIN payment_details pd
        ON	 pd.orderID = o.orderID
    WHERE 	YEAR(o.order_date) = '${order_year}'
      AND  MONTH	(o.order_date) = '${order_month}'
       AND 	o.status = 'D' 
    GROUP BY	DAY(o.order_date)
    ;`;

    db.query(querySearch, function(error, results, fields) {
      if (error) {
        res.send({
          code: 400,
          failed: "error ocurred"
        });
      } else {
        if (results.length > 0) {
          message = `Daily Report for Year ${order_year} Month ${order_month}`;
          res.render('M1/displayReportRes', {
              message,
              title: "Daily Order Report",
              results: results
          })
        } else {
          message = "No Results!";
          res.render('M1/displayReportRes', {
              message,
              title: "Daily Order Report",
              results: ""
          })
        }
      }
    });
  }
};
