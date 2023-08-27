export async function InitEvents() {};

let payload: Payload = null;

// UR PHONE RELATED SHIT
AddEventHandler("ez-untangle:phoneAPIReady", () => {
    // todo: Add a check as soon as phone is ready
    return true;
});
AddEventHandler("ez-untangle:updatePhoneStatus", (type: string, pObject: any) => {
    // todo: Update phone status, this is based on the phone u r using
});

EZRP.Procedures.register("ez-untangle:verify:userRank", async (pRank: any) => {
    if (pRank == "dev" || pRank == "admin") {
        return true;
    }

    return false;
});

EZRP.Procedures.register("np:fiber:player:init", async () => {
    return {
        token: payload.token,
        rest_api: payload.rest_api,
        socket_api: payload.socket_api,
        server_hash: payload.server_hash,
    }
});