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

          db.query(
            queryAdd,
            function(error, results, fields) {
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
            }
          );
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
    res.render("M1/updateRes", {
      message: ""
    });
  },

  updateRes: (req, res) => {
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
          message = "resident_email does not exist!";
          // res.render('.ejs', {
          //     message
          //     title: "Update Resident Detail"
          // })
          console.log("resident_email does not exist!");
        } else {
          let queryUpdate = `
                    UPDATE residents 
                    SET application_status =  '${application_status}', 
                    user_email =  '${user_email}', 
                    householdID = ${householdID} 
                    WHERE resident_email = '${resident_email}';`;

          db.query(queryUpdate, function(error, results, fields) {
            if (error) {
              res.send({
                code: 400,
                failed: "an error ocurred"
              });
            } else {
              message = "Resident successfully updated!";
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

  searchRes: (req, res) => {
    res.render("M1/searchRes", {
      message: ""
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
        if (reults.length > 0) {
          message = "";
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
  }
};
