import { InitEvents } from "./events";
import { InitEntity } from "./entity";
import * as Repository from "./repository";

export async function Init(): Promise<void> {
    await InitEvents();
    await InitEntity();
    await Repository.Init();
}