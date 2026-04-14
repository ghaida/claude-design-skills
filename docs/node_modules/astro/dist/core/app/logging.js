import { consoleLogDestination } from "../logger/console.js";
import { AstroLogger } from "../logger/core.js";
function createConsoleLogger(level) {
  return new AstroLogger({
    destination: consoleLogDestination,
    level: level ?? "info"
  });
}
export {
  createConsoleLogger
};
