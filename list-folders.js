const fs = require('fs');
const path = require('path');

const directoryPath = 'repos'; // Substitua pelo caminho do diretório que você deseja listar

fs.readdir(directoryPath, { withFileTypes: true }, (err, files) => {
  if (err) {
    console.error('Erro ao ler o diretório:', err);
    return;
  }

  const folders = files
    .filter(file => file.isDirectory())
    .map(file => file.name);

  const json = JSON.stringify({ folders });

  fs.writeFile('folders.json', json, 'utf8', err => {
    if (err) {
      console.error('Erro ao gravar o arquivo:', err);
      return;
    }

    console.log('Arquivo JSON gerado com sucesso!');
  });
});