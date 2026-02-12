import { readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const distRoot = "docs/.vitepress/dist";
const cssRelPattern = /rel="preload stylesheet"/g;

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
  const fixed = original.replace(cssRelPattern, 'rel="stylesheet"');
  if (fixed !== original) {
    writeFileSync(filePath, fixed, "utf8");
    updated += 1;
  }
}

console.log(`[fix-css-link-rel] Updated ${updated} HTML files.`);
