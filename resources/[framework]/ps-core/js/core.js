"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const moment_1 = __importDefault(require("moment"));
const PSCore = {
    Time: {
        GetDateWithTime() {
            return (0, moment_1.default)().format('LLL');
        },
        GetTime() {
            return (0, moment_1.default)().format('LT');
        },
        GetTimeWithSeconds() {
            return (0, moment_1.default)().format('LTS');
        },
        GetFullTime() {
            return (0, moment_1.default)().format('LLLL');
        },
        GetTimeAgo(date) {
            return (0, moment_1.default)(date).fromNow();
        },
        GetDayOfWeek() {
            return (0, moment_1.default)().format('dddd');
        },
        GetTimeFromNow(date) {
            return (0, moment_1.default)(date).fromNow(true);
        },
        GetUnixTimestamp() {
            return (0, moment_1.default)().unix();
        },
        GetHour() {
            return (0, moment_1.default)().hour();
        },
        GetMinutesOfHour() {
            return (0, moment_1.default)().minute();
        },
        GetSecondsOfMinute() {
            return (0, moment_1.default)().second();
        },
        GetTimeSince(date) {
            return (0, moment_1.default)(date).diff((0, moment_1.default)());
        },
    },
    Logger: {
        LogClientObject(object) {
            console.table(object);
        },
        ShowClientCallstack() {
            console.trace();
        },
    },
    Functions: {},
};
