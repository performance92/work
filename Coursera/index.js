const express = require('express');
const app = express();
const port = 3000;

let messages = [];

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get('/', (req, res) => {
  let html = `<h1>Guestbook v1</h1>
    <form method="post" action="/add">
      <input type="text" name="message" placeholder="Mesajınızı yazın" required/>
      <button type="submit">Gönder</button>
    </form>
    <ul>${messages.map(m => `<li>${m}</li>`).join('')}</ul>`;
  res.send(html);
});

app.post('/add', (req, res) => {
  const message = req.body.message;
  if (message) messages.push(message);
  res.redirect('/');
});

app.listen(port, () => {
  console.log(`Guestbook uygulaması http://localhost:${port} adresinde çalışıyor.`);
});
