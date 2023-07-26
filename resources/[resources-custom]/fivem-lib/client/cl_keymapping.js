function HashString(command) {
    let hash = 0;
    let string = command.toLowerCase();
    for(i=0; i < string.length; i++) {
      let letter = string[i].charCodeAt();
      hash = hash + letter;
      hash += (hash << 10 >>> 0);
      hash ^= (hash >>> 6);
      hash = hash >>> 0
    }

    hash += (hash << 3);
    if (hash < 0) {
      hash = hash >>> 0
    }
    hash ^= (hash >>> 11);
    hash += (hash << 15);
    if (hash < 0) {
      hash = hash >>> 0
    }
    return ("0x" + hash.toString(16).toUpperCase());
}
exports("HashString", HashString);

function Bind(hash) {
    let bind = GetControlInstructionalButton(2, hash, 1);
    print(bind)
    if (bind.search("t_") > -1) { bind = bind.replace("t_", "") }
    return bind;
}
exports("Bind", Bind);

function GetTime() {
  return Date.now();
}
exports("GetTime", GetTime);