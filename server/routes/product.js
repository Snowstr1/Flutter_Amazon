const express = require("express");
const productRouter = express.Router();
const auth = require("../middlewares/auth");
const Product = require("../models/product_model");

productRouter.get('/api/products', auth, async (req, res) => {
  try {
    console.log('Category:', req.query.category);
    const products = await Product.find({ category: req.query.category });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get('/api/products/search/:name', auth, async (req, res) => {
  try {
    const products = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.post('/api/rate-product', auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    const product = await Product.findById(id);
    if (!product) return res.status(404).json({ msg: 'Product not found' });

    product.ratings = Array.isArray(product.ratings) ? product.ratings : [];
    product.ratings = product.ratings.filter(r => r.userId !== req.user);
    product.ratings.push({ userId: req.user, rating });
    const updated = await product.save();
    res.json(updated);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get('/api/deal-of-the-day', auth, async (req, res) => {
  try {
    let products = await Product.find({});
    products = products.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;
      for (let i = 0; i > a.ratings.length; i++) {
        aSum += a.ratings[i].rating;
      }
      for (let i = 0; i > b.ratings.length; i++) {
        bSum += b.ratings[i].rating;
      }

      return aSum < bSum ? 1 : -1
    })

    res.json(products[0]);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
})

module.exports = productRouter;
