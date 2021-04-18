const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const app = express();
const cors = require("cors");
const swaggerJSDoc = require("swagger-jsdoc");
const swaggerUI = require("swagger-ui-express");

const swaggerOptions = {
  swaggerDefinition: {
    info: {
      title: "Shop",
      description: "Backend",
      contact: {
        name: "Yuuki",
      },
      servers: "http://localhost:3636",
    },
  },
  apis: ["app.js", ".routes/*.js"],
};

const swaggerDocs = swaggerJSDoc(swaggerOptions);
app.use("/api/docs", swaggerUI.serve, swaggerUI.setup(swaggerDocs));

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE");
  res.header("Access-Control-Allow-Headers", "Content-Type");
  next();
});
app.use(logger("combined"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

const usersRouter = require("./routes/users");
const productsRouter = require("./routes/products");
const authRouter = require("./routes/auth");
const orderRouter = require("./routes/order");



app.use("/api/users", usersRouter);
app.use("/api/products", productsRouter);
app.use("/api/auth", authRouter);
app.use("/api/orders", orderRouter);

module.exports = app;
