const express = require("express");
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors({ origin: true, credentials: true }));
app.use(express.json());

const users = [];

app.get("/", (_req, res) => {
  res.json({ ok: true, service: "medbridge-backend" });
});

app.get("/api", (_req, res) => {
  res.json({ ok: true, api: "v1" });
});

app.post("/api/auth/signup", (req, res) => {
  const { name, email, phone, password } = req.body || {};

  if (!name || !email || !phone || !password) {
    return res.status(400).json({ message: "Missing required fields." });
  }

  const exists = users.find((u) => u.email.toLowerCase() === String(email).toLowerCase());
  if (exists) {
    return res.status(409).json({ message: "Account already exists with this email." });
  }

  users.push({ name, email, phone, password });
  return res.status(201).json({ message: "Account created successfully." });
});

app.post("/api/auth/login", (req, res) => {
  const { email, password } = req.body || {};
  const user = users.find((u) => u.email.toLowerCase() === String(email).toLowerCase());

  if (!user || user.password !== password) {
    return res.status(401).json({ message: "Invalid email or password." });
  }

  return res.status(200).json({
    token: `demo-token-${Date.now()}`,
    user: { name: user.name, email: user.email, phone: user.phone },
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
