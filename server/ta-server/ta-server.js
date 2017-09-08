const express = require('express')
const app = express()

const alunos = [{nome:'Paulo',cpf:'683',email:'phmb@cin',metas:{'requisitos':'MA'}},{nome:'Mariana',cpf:'456',email:'@mcb@cin',metas:{'requisitos':'MPA'}}]

app.get('/', function (req, res) {
  res.send(alunos)
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})
