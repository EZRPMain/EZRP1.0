import * as Controllers from './controllers';

on("onClientResourceStop", (resource: string) => {
    emitNet("baseevents:hotreload", resource);
});

const ResName = GetCurrentResourceName();

on("onClientResourceStart", async (resource: string) => {
    if (resource !== ResName) return;
    await Controllers.Init();
});