declare namespace EZRP {
    class Events {
        static addHook(name: string, cb: (...args: any) => any): void;
        static start(): Promise<void>;
    }

    class Procedures {
        static register(name: string, cb: (src: number, ...args: any) => any): void;
        static execute(name: string, ...args: any): any;
    }
}