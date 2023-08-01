const fs = require('fs')
const directoryPath = 'pages';

fs.readdir(directoryPath, { withFileTypes: true }, (err, files) => {
  if (err) {
    console.error('Error reading directory:', err);
    return;
  }

  const folders = files
    .filter(file => file.isDirectory())
    .map(file => file.name);

  const json = JSON.stringify({ folders });

  fs.writeFile('folders.json', json, 'utf8', err => {
    if (err) {
      console.error('Error writing file:', err);
      return;
    }
  });
});