module.exports = {
  home: (req, res) => {
    res.render("GL/GL.ejs", {
      title: "GL"
    });
  },

  M1: (req, res) => {
    res.render("M1/M1.ejs", {
      title: "M1"
    });
  },

  M2: (req, res) => {
    res.render("M2/M2.ejs", {
      title: "M2"
    });
  }
};
