// const app = equire('../app')

module.exports = {

    signIn: (req, res) => {
            res.render('signIn', {
                message : ""
            })
    },

    validation: (req, res) => {
        let username = req.body.username;
        let password = req.body.password;

        db.query('SELECT * FROM users WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
            if (error) {
                // console.log("error ocurred",error);
                res.send({
                  "code":400,
                  "failed":"error ocurred",
                })
            }
            else{
                if(results.length >0){
                  if(results[0].password == password){
                    res.render('logged.ejs', {
                    })
                  }
                }
                else{
                    res.render('signIn.ejs', {
                        message : "Wrong credentials. Please try again"
                    })
                }
            }
        });
    }
}
