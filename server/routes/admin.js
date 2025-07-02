const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const Product = require("../models/product_model");

adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });
        product = await product.save();
        return res.json(product);
    } catch (e) {
        return res.status(500).json({ error: e.message });
    }
}
);

adminRouter.get("/admin/get-product", admin, async (req, res) => {
    try {
        const products = await Product.find({});
        return res.json(products);
    } catch (e) {
        return res.status(500).json({ error: e.message });
    }
}
);

adminRouter.post("/admin/delete-product", admin, async (req, res) => {
    try {
        const { id } = req.body;
        const deleted = await Product.findByIdAndDelete(id);
        if (!deleted) {
            return res.status(404).json({ msg: "Product not found" });
        }
        return res.json({ msg: "Product deleted", product: deleted });
    } catch (e) {
        return res.status(500).json({ error: e.message });
    }
}
);

module.exports = adminRouter;
