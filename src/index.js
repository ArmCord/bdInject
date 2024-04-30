const pkg = require("./package.json");
const Module = require("module");
const path = require("path");

try {
  const kernel = require(path.join(__dirname, "kernel.asar"));
  if (kernel?.default) kernel.default({ startOriginal: true });
} catch(e) {
  console.error("Kernel failed to load: ", e.message);
  Module._load(path.join(__dirname, "..", "app-original.asar"), null, true);
}
