const fs = require('fs');
const path = 'd:\\Downloads\\.Antigravity\\소액수의 분석\\소액수의 분석.html';

let content = fs.readFileSync(path, 'utf8');

// Find the target string
const marker = "sortTable('pjtSumTable', 5, 'str')";
const idx = content.indexOf(marker);
if (idx < 0) {
  console.log('marker not found');
  process.exit(1);
}

// Find the slice around it
const slice = content.slice(idx - 5, idx + 500);
console.log('FOUND SLICE:\n', JSON.stringify(slice));
