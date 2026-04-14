import type { AstroInlineConfig } from '../../types/public/config.js';
import { AstroLogger } from './core.js';
import { type AstroLogMessage, type AstroLoggerDestination } from './core.js';
export declare const nodeLogDestination: AstroLoggerDestination<AstroLogMessage>;
export declare function enableVerboseLogging(): void;
export declare function createNodeLogger(inlineConfig: AstroInlineConfig): AstroLogger;
