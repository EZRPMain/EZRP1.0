import moment from 'moment';

interface PSCore {
	Time: {
		GetDateWithTime(): string;
		GetTime(): string;
		GetTimeWithSeconds(): string;
		GetFullTime(): string;
		GetTimeAgo(date: Date): string;
		GetDayOfWeek(): string;
		GetTimeFromNow(date: Date): string;
		GetUnixTimestamp(): number;
		GetHour(): number;
		GetMinutesOfHour(): number;
		GetSecondsOfMinute(): number;
		GetTimeSince(date: Date): number;
	};
	Logger: {
		LogClientObject(object: object): void;
		ShowClientCallstack(): void;
	};
	Functions: {};
}

const PSCore: PSCore = {
	Time: {
		GetDateWithTime(): string {
			return moment().format('LLL');
		},
		GetTime(): string {
			return moment().format('LT');
		},
		GetTimeWithSeconds(): string {
			return moment().format('LTS');
		},
		GetFullTime(): string {
			return moment().format('LLLL');
		},
		GetTimeAgo(date: Date): string {
			return moment(date).fromNow();
		},
		GetDayOfWeek(): string {
			return moment().format('dddd');
		},
		GetTimeFromNow(date: Date): string {
			return moment(date).fromNow(true);
		},
		GetUnixTimestamp(): number {
			return moment().unix();
		},
		GetHour(): number {
			return moment().hour();
		},
		GetMinutesOfHour(): number {
			return moment().minute();
		},
		GetSecondsOfMinute(): number {
			return moment().second();
		},
		GetTimeSince(date: Date): number {
			return moment(date).diff(moment());
		},
	},
	Logger: {
		LogClientObject(object: object): void {
			console.table(object);
		},
		ShowClientCallstack(): void {
			console.trace();
		},
	},
	Functions: {},
};
