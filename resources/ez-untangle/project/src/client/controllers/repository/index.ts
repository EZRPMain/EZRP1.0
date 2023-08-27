import { InitDebug } from "./debug";
import { InitAPI } from "./api";

export async function Init(): Promise<void> {
    await InitDebug();
    await InitAPI();
}