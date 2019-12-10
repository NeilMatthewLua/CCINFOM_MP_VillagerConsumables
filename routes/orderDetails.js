module.exports = {
  addODPage: (req, res) => {
    res.render("M1/addOD", {
      title: "Add Order Detail",
      message: "Add Order Detail"
    });
  }
};
