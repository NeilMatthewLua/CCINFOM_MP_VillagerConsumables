module.exports = {
  addPDPage: (req, res) => {
    res.render("M2/addPD", {
      title: "Add Payment Detail",
      message: "Add Payment Detail"
    });
  }
};
