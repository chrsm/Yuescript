import { readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const distRoot = "docs/.vitepress/dist";
const preloadStylesheetRelPattern = /rel="preload stylesheet"/g;
const stylesheetAsPattern = /(<link[^>]*rel="stylesheet"[^>]*?)\s+as="style"/g;

function walk(dir, files = []) {
  for (const entry of readdirSync(dir)) {
    const fullPath = join(dir, entry);
    const stat = statSync(fullPath);
    if (stat.isDirectory()) {
      walk(fullPath, files);
    } else if (fullPath.endsWith(".html")) {
      files.push(fullPath);
    }
  }
  return files;
}

let updated = 0;
for (const filePath of walk(distRoot)) {
  const original = readFileSync(filePath, "utf8");
  let fixed = original.replace(preloadStylesheetRelPattern, 'rel="stylesheet"');
  fixed = fixed.replace(stylesheetAsPattern, "$1");
  if (fixed !== original) {
    writeFileSync(filePath, fixed, "utf8");
    updated += 1;
  }
}

console.log(`[fix-css-link-rel] Updated ${updated} HTML files.`);
