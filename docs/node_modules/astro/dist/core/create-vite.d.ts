import nodeFs from 'node:fs';
import * as vite from 'vite';
import type { AstroSettings, RoutesList } from '../types/astro.js';
import type { AstroLogger } from './logger/core.js';
type CreateViteOptions = {
    settings: AstroSettings;
    logger: AstroLogger;
    mode: string;
    fs?: typeof nodeFs;
    routesList: RoutesList;
    sync: boolean;
} & ({
    command: 'dev';
} | {
    command: 'build';
});
/** Return a base vite config as a common starting point for all Vite commands. */
export declare function createVite(commandConfig: vite.InlineConfig, { settings, logger, mode, command, fs, sync, routesList }: CreateViteOptions): Promise<vite.InlineConfig>;
export {};
