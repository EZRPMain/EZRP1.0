export function RegisterUICallbackType(name: string, fn: any) {
    RegisterNuiCallbackType(name)
    on(`__cfx_nui:${name}`, fn);
}

export function SendUIMessage(jsonString: string | {}) {
    SendNuiMessage(JSON.stringify(jsonString));
}