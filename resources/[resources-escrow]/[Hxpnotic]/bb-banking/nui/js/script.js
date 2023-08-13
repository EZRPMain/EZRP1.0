(function ($) {
	"use strict";

	$("#sidebarToggle, #sidebarToggleTop").on("click", function (e) {
		$("body").toggleClass("sidebar-toggled");
		$(".sidebar").toggleClass("toggled");
		if ($(".sidebar").hasClass("toggled")) {
			$(".sidebar .collapse").collapse("hide");
		}
	});

	// Close any open menu accordions when window is resized below 768px
	$(window).resize(function () {
		if ($(window).width() < 768) {
			$(".sidebar .collapse").collapse("hide");
		}

		// Toggle the side navigation when window is resized below 480px
		if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
			$("body").addClass("sidebar-toggled");
			$(".sidebar").addClass("toggled");
			$(".sidebar .collapse").collapse("hide");
		}
	});

	// Prevent the content wrapper from scrolling when the fixed side navigation hovered over
	$("body.fixed-nav .sidebar").on(
		"mousewheel DOMMouseScroll wheel",
		function (e) {
			if ($(window).width() > 768) {
				var e0 = e.originalEvent,
					delta = e0.wheelDelta || -e0.detail;
				this.scrollTop += (delta < 0 ? 1 : -1) * 30;
				e.preventDefault();
			}
		}
	);

	// Scroll to top button appear
	$(document).on("scroll", function () {
		var scrollDistance = $(this).scrollTop();
		if (scrollDistance > 100) {
			$(".scroll-to-top").fadeIn();
		} else {
			$(".scroll-to-top").fadeOut();
		}
	});

	// Smooth scrolling using jQuery easing
	$(document).on("click", "a.scroll-to-top", function (e) {
		var $anchor = $(this);
		$("html, body")
			.stop()
			.animate(
				{
					scrollTop: $($anchor.attr("href")).offset().top,
				},
				1000,
				"easeInOutExpo"
			);
		e.preventDefault();
	});
})(jQuery); // End of use strict

// --------------------------------------------------------------------
// colorreplace" color-type='text' defaultcolor='warning'>
var currentActiveCard = 0;
var currentATMCard = 0;
var currentWALLETCard = 0;
var currentCards = [];
var currentWallet = [];
var walletCash = 0;
var eData = {};
var currentModal = "account";
var popupOpened = false;
var cashEvents = [];
var cryptoInformation = {};
var lang = {}
var colorTHEME = '';

function createCard(obj, index) {
	if (obj != "CREATE") {
		if (
			obj["type"] != undefined &&
			obj["type"] != null &&
			obj["type"] == "account"
		) {
			const cardstatus = function (status) {
				if (status == 0) {
					return "<span class='visacard-status text-success'>ACTIVE</span>";
				} else {
					return "<span class='visacard-status text-danger'>DISABLED</span>";
				}
			};
			return (
				"<div class='visacard bg-gradient-primary' card='" +
				index +
				"'><i class='visacard-logo fab fa-cc-visa text-gray-200'></i>" +
				cardstatus(obj["hold"]) +
				"<span class='visacard-number text-gray-200'>" +
				obj["number"] +
				"</span><br><span class='visacard-name text-gray-200'>" +
				obj["data"]["holder"] +
				"</span><span class='visacard-date text-gray-200'>" +
				obj["data"]["date"] +
				"</span></div>"
			);
		}
	} else {
		return (
			"<div class='visacard bg-gradient-primary' card='" +
			index +
			'\'><i class=\'visacard-logo fab fa-cc-visa text-gray-200\'></i><div class="input-group pinset"><input type="password" mainclass=\'pinset\' class="pinSet-text form-control border-0 small" placeholder="XXXX" aria-label="Search" aria-describedby="basic-addon2"></div><a href=\'#\' class=\'btn bg-gray-200 create-visacard pxl-15 resetamount\' card=\'' +
			index +
			"'><span class='text text-gray-800'>CREATE</span></a><span class='visacard-name text-gray-200'>UNKNOWN</span></div>"
		);
	}
}

function createATMCard(obj, index) {
	return (
		"<div class='atmcard'><i class='atmcard-logo fab fa-cc-visa text-gray-200'></i><span class='atmcard-number text-gray-200'>" +
		obj["number"] +
		"</span><br><span class='atmcard-name text-gray-200'>" +
		obj["data"]["holder"] +
		"</span><span class='atmcard-date text-gray-200'>" +
		obj["data"]["date"] +
		"</span><a class=\"btn colorreplace btn-small border-0 small resetamount\" color-type='btn' defaultcolor='primary' data-toggle=\"modal\" data-target=\"#pinVerification\" data-toggletype='account' card='" +
		index +
		'\'><i class="fas fa-sign-in-alt"></i></a></div>'
	);
}

function createWALLETCard(obj, index) {
	return (
		"<div class='walletcard bg-gradient-primary' style='margin-left: " + (46 * index) + "vh;' card='" + index + "'><i class='walletcard-logo fab fa-cc-visa text-gray-200'></i>" +
        "<span class='walletcard-number text-gray-200'>" + obj["number"] + "</span><br>" +
        "<span class='walletcard-name text-gray-200'>" + obj["data"]["holder"] + "</span>" + 
        "<span class='walletcard-date text-gray-200'>" + obj["data"]["date"] + "</span>" + 
		"<span class='walletcard-actions text-gray-200'><a class='btn walletcard-btn-give colorreplace btn-light btn-block border-0 small resetamount' card='" + index + " color-type='btn' defaultcolor='primary' data-toggle=\"modal\" data-target=\"#walletGiveL\" data-toggletype='walletcard'>GIVE</a></span></div>"
	);
}

$(document).ready(function () {
	$("#wrapper").hide();
	//$("#crypto-content").hide();

	$("#atm-wrapper").hide();
	$("#atm-wrapper #cards").hide();
	$("#atm-wrapper #mainatm").hide();

	//$(".wrapper-cashcommand").hide();
	//$('.cashevent-addons #log').hide();
	//$(".wrapper-popup").hide();
	//$(".wrapper-wallet").hide();
	$.post("https://bb-banking/finishAuth");
});

window.addEventListener("message", function (event) {
	eData = event.data;
	if (eData.type == "create") {
		$("#wrapper").show();
		$("#main-content").show();
		$(".wrapper-popup").fadeOut(750);
		$("#atm-wrapper").hide();
		$("#atm-wrapper").hide();
		$("#crypto-content").hide();
	} else if (eData.type == "atm") {
		$("#atm-wrapper").show();
		$("#atm-wrapper #cards").show();
		$("#atm-wrapper #mainatm").hide();
		$(".wrapper-popup").fadeOut(750);
		$("#wrapper").hide();
	} else if (eData.type == "cash") {
		$(".wrapper-cashcommand #content #amount").html(
			eData.casheData.amount
				.toString()
				.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
		);
		$(".wrapper-cashcommand").show();
		$('.cashevent-addons #log').hide();
		setTimeout(() => {
			$(".wrapper-cashcommand").fadeOut(750);
		}, 7500);
	} else if (eData.type == "cashe") {
		$(".wrapper-cashcommand #content #amount").html(
			eData.casheData.amount
				.toString()
				.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
		);
		$(".cashevent-addons #log #amount").html(
			eData.casheData.addedamount.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
		);
		$(".cashevent-addons #log").show();
		$(".wrapper-cashcommand").show();
		setTimeout(() => {
			$(".wrapper-cashcommand").fadeOut(750);
			$(".cashevent-addons #log").hide();
		}, 7500);
	} else if (eData.type == "close") {
		$("#main-content").hide();
		$("#saving-content").hide();
		$("#credits-content").hide();
		$("#crypto-content").hide();
		$("#stats-content").hide();
		$("#wrapper").hide();

		$("#atm-wrapper").hide();
		$("#atm-wrapper #cards").hide();
		$("#atm-wrapper #mainatm").hide();
		if (popupOpened == true) {
			$(".wrapper-popup").show();
		}
	} else if (eData.type == "popup") {
		popupOpened = eData.popupTrigger;
		if (eData.popupTrigger == true) {
			$('.wrapper-popup #fasfas').html('[' + eData.popupKey + ']');
			$('.wrapper-popup #content #amount').html(lang.popup[eData.popupType])
			$(".wrapper-popup").show();
		} else {
			$(".wrapper-popup").fadeOut(750);
		}
	} else if (eData.type == "crypto") {
		cryptoInformation["price"] = eData.crypto.price;
		cryptoInformation["presentage"] = eData.crypto.presantage;

		var chartdat = eData.crypto.chart;
		var keys = [];
		var values = [];

		if (chartdat) {
			Object.entries(chartdat).forEach(([k, v]) => {
				keys.push(v["date"][0] + "/" + v["date"][1]);
				values.push(v["price"]);
			});
		}
		
		createCryptoChart(keys, values, colorTHEME);

		var priceSup = "<sup ";
		if (eData.crypto.presantage > 0)
			priceSup +=
				"class='text-success'>" +
				eData.crypto.presantage.toFixed(2) +
				"%</sup>";
		else
			priceSup +=
				"class='text-danger'>" +
				eData.crypto.presantage.toFixed(2) +
				"%</sup>";
		$("#textreplace-cryptoprice").html(
			"$" +
				eData.crypto.price
					.toFixed(2)
					.toString()
					.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") +
				priceSup
		);

		$('.crypto-price-container').html('<i class="fab fa-bitcoin"></i>&ensp;$' + eData.crypto.price.toFixed(2).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + priceSup)
	} else if (eData.type == "nui") {
		if (eData.lang) {
			var ln = eData.lang;

			// leftNav
			$('.lang_ln_actions').html(ln.leftNav.actions);
			$('.lang_ln_svacc').html(ln.leftNav.savingAccountCont);
			$('.lang_ln_credits').html(ln.leftNav.creditCardsCont);
			$('.lang_ln_crypt').html(ln.leftNav.cryptoCurrencyCont);
			$('.lang_ln_sts').html(ln.leftNav.statisticsCont);

			// Modals
			$('.lang_modal_success').html(ln.modals.success);
			$('.lang_modal_continue').html(ln.modals.confirm);
			$('.lang_modal_error').html(ln.modals.error);
			$('.lang_modal_headerwithdraw').html(ln.modals.widtrawModal.header);
			$('.lang_modal_wgetwithdraw').html(ln.modals.widtrawModal.willget);
			$('.lang_modal_cancel').html(ln.modals.cancel);
			$('.lang_modal_confirm').html(ln.modals.confirm);
			$('.lang_modal_headerdepo').html(ln.modals.depoModal.header);
			$('.lang_modal_wgetdepo').html(ln.modals.depoModal.willget);
			$('.lang_modal_headertras').html(ln.modals.transferModal.header);
			$('.lang_modal_wgettras').html(ln.modals.transferModal.willget);

			$('.lang_modal_hcrypts').html(ln.modals.cryptosModal.header);
			$('.lang_modal_wcrypts').html(ln.modals.cryptosModal.willget);
			$('.lang_modal_hcryptb').html(ln.modals.cryptobModal.willget);
			$('.lang_modal_wcryptb').html(ln.modals.cryptobModal.willget);

			$('.lang_m_accbal').html(ln.accBalance);
			$('.lang_m_accrevlast').html(ln.accRevenueLast);
			$('.lang_m_acccards').html(ln.accCards);
			$('.lang_m_accrev').html(ln.accRevenue);
			$('.lang_m_accqact').html(ln.accQActions);
			$('.lang_m_accwith').html(ln.Withdraw);
			$('.lang_m_accdepo').html(ln.Deposit);
			$('.lang_m_acctrans').html(ln.Transfer);
			$('.lang_m_acccrypt').html(ln.accCrypt);
			$('.lang_m_acccryptwallet').html(ln.accCryptWaller);

			$('.lang_cryp_price').html(ln.cryptPrice);
			$('.lang_cryp_bal').html(ln.cryptBalance);
			$('.lang_cryp_pricel').html(ln.cryptPriceLast);

			$('.lang_svi_nacc').html(ln.svingNoAcc);
			$('.lang_svi_acccreate').html(ln.svingCreate);
			$('.lang_svi_accbal').html(ln.svingBalance);
			$('.lang_svi_accact').html(ln.svingActions);

			$('.lang_sts_wlast').html(ln.stsWithLast);
			$('.lang_sts_dlast').html(ln.stsDepoLast);
			$('.lang_sts_header').html(ln.stsHeader);
			
			for (var i = 0; i < ln.stsTable.length; i++){
				$('.lang_sts_t_' + i).html(ln.stsTable[i]);
			}

			$('.lang_atm_pin').html(ln.atmEnterPin);
			$('.lang_atm_cards').html(ln.atmCards);
			$('.lang_atm_bal').html(ln.atmBalance);

			try {
				$('.wrapper-popup #content #title').html(ln.popup.toAccess);
				$('.wrapper-cashcommand #content #title').html(ln.currentCashAmount);
				$('.wallet_cashheader').html(ln.currentCash);
			} catch(err) {}

			lang = ln;
		}
		
		if (eData.sets) {
			$('.mainlogo_replace').attr('src', eData.sets.logo);
			$('.atmlogo_replace').attr('src', eData.sets.logo);
			if (eData.sets.stats == false) {
				$('.stsenablecheck').hide();
			}
			colorTHEME = eData.sets.color;
		}
	} else if (eData.type == "wallet") {
		$(".wrapper-wallet").show();
		$(".wrapper-wallet .main").show();
		$(".next-creditcardw").hide();
		$(".back-creditcardw").hide();

		$('.wallet_currentcash').html('$' + eData.cash.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"))
		$('.wallet_iban').val(eData.iban)
		walletCash = eData.cash;
		currentWallet = [];

		currentWallet = eData.wallet;
		var length = currentWallet.length;
		var newHtml = "";
		for (i = 0; i < length; i++) {
			newHtml += createWALLETCard(currentWallet[i], i);
		}

		currentActiveCard = 0;
		if (length > 1) {
			$(".next-creditcardw").show();
		}

		$(".credit-cards-containerw").html(newHtml);
		$(".credit-cards-containerw").animate({ "margin-left": "27vh" }, 250);
	}

	if (eData.data != undefined && eData.data != null) {
		// set information
		$("#textreplace-accountname").html(
			lang.leftNav.loggedInTxt + ' ' + eData.data["information"]["name"]
		);
		$("#textreplace-accountid").html(
			lang.leftNav.accountIdTxt + ' ' + eData.data["information"]["iban"]
		);
	
		$("#textreplace-feesw").html(
			lang.modals.widtrawModal.fees + ' ' +
				eData.data["fees"]["withdraw"] +
				"%"
		);
		$("#textreplace-atmfeesw").html(
			lang.modals.widtrawModal.fees + ' ' +
				eData.data["fees"]["withdraw"] +
				"%"
		);
		$("#textreplace-feest").html(
			lang.modals.transferModal.fees + ' ' +
				eData.data["fees"]["transfer"] +
				"%"
		);
	
		$("#textreplace-accountbalance").html(
			"$" + eData.data["currentAmount"].toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
		);
	
		$("#textreplace-revenuelast").html(
			"$" +
				eData.data["chart"][0]
					.toString()
					.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
		);
		$(".textreplace-depolast").html(
			"$" +
				eData.data["lastdayData"][0]
					.toString()
					.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
		);
		$(".textreplace-withlast").html(
			"$" +
				eData.data["lastdayData"][1]
					.toString()
					.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
		);
		

		if (eData.data["cards"] != null && eData.data["cards"] != undefined) {
			$("#textreplace-activecards").html(eData.data["cards"].length);
		} else {
			$("#textreplace-activecards").html("None");
		}

		if (
			eData.data["information"]["accounts"]["saving"] != null &&
			eData.data["information"]["accounts"]["saving"] != undefined
		) {
			$("#textreplace-savingamount").html(
				"$" +
					eData.data["information"]["accounts"]["saving"]["amount"]
						.toString()
						.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
			);
			$(".account-doesnt-exists-saving-container").hide();
			$(".account-saving-container").show();
		} else {
			$(".account-doesnt-exists-saving-container").show();
			$(".account-saving-container").hide();
		}
		

		// credit cards stuff
		$(".next-creditcard").hide();
		$(".back-creditcard").hide();
		currentCards = [];

		creditCards = eData.data["cards"];
		var length = creditCards.length;
		if (length > 5) {
			length = 5;
		}

		var newHtml = "";
		for (i = 0; i < length; i++) {
			currentCards[i] = creditCards[i];
			newHtml += createCard(creditCards[i], i + 1);
		}

		if (length < 5) {
			newHtml += createCard("CREATE", length + 1);
			currentCards[currentCards.length] = { type: "CREATE" };
		}

		currentActiveCard = 0;
		if (length > 0) {
			$(".next-creditcard").show();
			$(".visacard-information-container").show();
		} else {
			$(".visacard-information-container").hide();
		}

		$(".credit-cards-container").html(newHtml);
		$(".credit-cards-container").animate({ "margin-left": "27vh" }, 250);
		$(".pinset").hide();

		if (
			eData.data["information"]["stats"][0] != undefined &&
			eData.data["information"]["stats"][0] != null
		) {
			var table = $("#dataTable").DataTable();
			table.clear().draw();
			for (i = 0; i < eData.data["information"]["stats"].length; i++) {
				var stat = eData.data["information"]["stats"][i];
				table.row
					.add([
						stat["source"],
						stat["from"],
						stat["type"],
						stat["amount"],
						stat["reason"],
					])
					.draw(false);
				//table.rows(i).nodes().to$().addClass(vehicle[4]);
			}
		}

		// Crypto
		$("#textreplace-cryptobalance").html(
			"$" +
				eData.data.cryptoData["value"]
					.toFixed(2)
					.toString()
					.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") +
				"<sup>" +
				eData.data.cryptoData["amount"] +
				"</sup>"
		);

		$('.crypto-balance-container').html(lang.accCryptBalance + " $" +
		eData.data.cryptoData["value"]
			.toFixed(2)
			.toString()
			.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") +
		"<sup>" +
		eData.data.cryptoData["amount"].toFixed(5) +
		"</sup>")

		if (eData.data.nui["enableCustomColor"] == true) {
			createAccountRevenueChart(
				[
					eData.data["chart"][7],
					eData.data["chart"][6],
					eData.data["chart"][5],
					eData.data["chart"][4],
					eData.data["chart"][3],
					eData.data["chart"][2],
					eData.data["chart"][1],
					eData.data["chart"][0],
				],
				eData.data.nui["customColor"],
				["7 " + lang.daysT, "6 " + lang.daysT, "5 " + lang.daysT, "4 " + lang.daysT, "3 " + lang.daysT, "2 " + lang.daysT, lang.yesterdayT, lang.todayT]
			);

			$(".colorreplace").each(function (index) {
				var typ = $(this).attr("color-type");
				$(this).addClass(typ + "-bb-" + eData.data.nui["customColor"]);
			});
		}
	}

	if (eData.atmCards != undefined && eData.atmCards != null) {
		currentCards = [];

		creditCards = eData.atmCards["cards"];
		var length = creditCards.length;
		var newHtml = "";
		for (i = 0; i < length; i++) {
			currentCards[i] = creditCards[i];
			newHtml += createATMCard(creditCards[i], i + 1);
		}
		$("#atm-wrapper .atmcards").html(newHtml);
		$("#textreplace-atmbalance").html(
			currentCards[currentATMCard]["balance"]
				.toString()
				.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
		);

		$(".colorreplace").each(function (index) {
			var typ = $(this).attr("color-type");
			$(this).addClass(typ + "-bb-" + eData.atmCards.nui["customColor"]);
		});
	}

	if (eData.message != null && eData.message != undefined) {
		showMessage(eData.message[0], eData.message[1], eData.message[2]);
	}
});

$(".next-creditcard").click(function () {
	currentActiveCard += 1;
	if (currentActiveCard == currentCards.length - 1) {
		$(".next-creditcard").hide();
	}
	if (currentActiveCard > 0) {
		$(".back-creditcard").show();
	}
	$(".visacard-information-container").hide();
	$(".credit-cards-container").animate(
		{
			"margin-left":
				(
					parseFloat(
						$(".credit-cards-container")
							.css("margin-left")
							.replace("px", "")
					) *
						(100 / $(document).height()) -
					57
				).toString() + "vh",
		},
		250
	);
	setTimeout(() => {
		if (currentCards[currentActiveCard]["type"] == "CREATE") {
			$(".visacard-information-container").hide();
		} else {
			$(".visacard-information-container").show();
		}
	}, 250);
});

$(".back-creditcard").click(function () {
	currentActiveCard -= 1;
	if (currentActiveCard == 0) {
		$(".back-creditcard").hide();
	}
	if (currentActiveCard < currentCards.length - 1) {
		$(".next-creditcard").show();
	}
	$(".visacard-information-container").hide();
	$(".credit-cards-container").animate(
		{
			"margin-left":
				(
					parseFloat(
						$(".credit-cards-container")
							.css("margin-left")
							.replace("px", "")
					) *
						(100 / $(document).height()) +
					57
				).toString() + "vh",
		},
		250
	);
	setTimeout(() => {
		if (currentCards[currentActiveCard]["type"] == "CREATE") {
			$(".visacard-information-container").hide();
		} else {
			$(".visacard-information-container").show();
		}
	}, 250);
});

$(".next-creditcardw").click(function () {
	currentActiveCard += 1;
	if (currentActiveCard == currentWallet.length - 1) {
		$(".next-creditcardw").hide();
	}
	if (currentActiveCard > 0) {
		$(".back-creditcardw").show();
	}

	$(".credit-cards-containerw").animate(
		{
			"margin-left":
				(
					parseFloat(
						$(".credit-cards-containerw") .css("margin-left") .replace("px", "") ) * (100 / $(document).height()) - 46).toString() + "vh",
		},
		100
	);
});

$(".back-creditcardw").click(function () {
	currentActiveCard -= 1;
	if (currentActiveCard == 0) {
		$(".back-creditcardw").hide();
	}
	if (currentActiveCard < currentWallet.length - 1) {
		$(".next-creditcardw").show();
	}
	$(".credit-cards-containerw").animate(
		{
			"margin-left":
				(
					parseFloat(
						$(".credit-cards-containerw")
							.css("margin-left")
							.replace("px", "")
					) *
						(100 / $(document).height()) + 46
				).toString() + "vh",
		},
		100
	);
});


$(".next-visacard").click(function () {
	currentActiveCard += 1;
	$(".back-visacard").addClass("hidden");
	var activeCard = $(".active-visacard");
	activeCard.addClass("back-visacard");
	activeCard.removeClass("active-visacard");
	var nextCard = $(".next-visacard");
	nextCard.addClass("active-visacard");
	nextCard.removeClass("next-visacard");
});

$(".account-doesnt-exists-btn").click(function () {
	$.post("https://bb-banking/createSavingAccount");
	$(".account-doesnt-exists-saving-container").hide();
	$(".account-saving-container").show();
});

$(document).on("click", ".switch-page", function (e) {
	var to = $(this).attr("to");
	$("#main-content").hide();
	$("#saving-content").hide();
	$("#credits-content").hide();
	$("#stats-content").hide();
	$("#crypto-content").hide();
	$("#" + to).show();
});

$(document).keyup(function (e) {
	if (e.keyCode === 27) {
		$.post("https://bb-banking/closeNui");
		$("#main-content").hide();
		$("#saving-content").hide();
		$("#credits-content").hide();
		$("#stats-content").hide();
		$("#wrapper").hide();
		$("#crypto-content").hide();

		$("#atm-wrapper").hide();
		$("#atm-wrapper #cards").hide();
		$("#atm-wrapper #mainatm").hide();
		$(".wrapper-wallet").fadeOut(450);
		if (popupOpened == true) {
			$(".wrapper-popup").show();
		}
	}
});

var amount = 0;
const wdraw = document.querySelector(".quickwithdrawmodal-text");
wdraw.addEventListener("input", (e) => {
	var newAmount = parseInt(e.target.value);
	var newAmountwFees = parseInt(
		((100 - eData.data["fees"]["withdraw"]) / 100) * newAmount
	);
	$(".wdraw #input-get #amount").html(newAmountwFees + "$");
	amount = newAmount;
});

const depo = document.querySelector(".quickdepomodal-text");
depo.addEventListener("input", (e) => {
	var newAmount = parseInt(e.target.value);
	$(".depow #input-get #amount").html(newAmount + "$");
	amount = newAmount;
});

const trasw = document.querySelector(".quicktransmodal-text");
trasw.addEventListener("input", (e) => {
	var newAmount = parseInt(e.target.value);
	var newAmountwFees = parseInt(
		((100 - eData.data["fees"]["transfer"]) / 100) * newAmount
	);
	$(".trasw #input-get #amount").html(newAmountwFees + "$");
	amount = newAmount;
});

const atmwdraw = document.querySelector(".atmwdraw-text");
atmwdraw.addEventListener("input", (e) => {
	var newAmount = parseInt(e.target.value);
	var newAmountwFees = 0;
	if (eData.atmCards) {
		newAmountwFees = parseInt(
			((100 - eData.atmCards["fees"]["withdraw"]) / 100) * newAmount
		);
	}
	if (eData.data) {
		newAmountwFees = parseInt(
			((100 - eData.data["fees"]["transfer"]) / 100) * newAmount
		);
	}
	$(".atmwdraw #input-get #amount").html(newAmountwFees + "$");
	amount = newAmount;
});

const cryptsell = document.querySelector(".cryptosell-text");
cryptsell.addEventListener("input", (e) => {
	var newAmount = parseInt(e.target.value);
	var newAmountConverted = (newAmount / cryptoInformation["price"]).toFixed(
		6
	);
	$(".cryptosell #input-get #amount").html(newAmountConverted + "~");
	amount = newAmount;
	amount = newAmount;
});

const cryptbuy = document.querySelector(".cryptobuy-text");
cryptbuy.addEventListener("input", (e) => {
	var newAmount = parseInt(e.target.value);
	var newAmountConverted = (newAmount / cryptoInformation["price"]).toFixed(
		6
	);
	$(".cryptobuy #input-get #amount").html(newAmountConverted + "~");
	amount = newAmount;
});

$(document).on("click", ".resetamount", function (e) {
	$(".wdraw #input-get #amount").html("0$");
	$(".depow #input-get #amount").html("0$");
	$(".trasw #input-get #amount").html("0$");
	$(".cryptobuy #input-get #amount").html("0.0");
	$(".cryptosell #input-get #amount").html("0.0");
	$(".pinSet-text").val("");
	$(".quickwithdrawmodal-text").val("");
	$(".quickdepomodal-text").val("");
	$(".quicktransmodal-text").val("");
	$(".cryptobuy-text").val("");
	$(".cryptosell-text").val("");
	currentModal = $(this).attr("data-toggletype");
	amount = 0;
});

$(document).on("click", ".visaaction", function (e) {
	currentAction = $(this).attr("visaaction");
	currentCard = currentCards[currentActiveCard];
	$.post(
		"https://bb-banking/cardEvent",
		JSON.stringify({ action: currentAction, card: currentCard })
	);
});

$(document).on("click", ".atmcard .btn", function (e) {
	currentATMCard = parseInt($(this).attr("card")) - 1;
});

$(document).on("click", ".quickconfirm", function (e) {
	var to = $(this).attr("datat");
	var id = document.getElementById("quicktransmodalid-text").value;
	if (to == "atmWithdraw" && amount == 0) {
		showMessage("error", "Amount cannot be 0", "ATM");
		return 
	}
	if (to != "pinVerification" &&  to != 'walletGiveL' && amount == 0) {
		showMessage("error", "Amount cannot be 0", "");
	} else {
		if (to == "quickwithdrawmodal") {
			if (currentModal == "account") {
				if (eData.data["currentAmount"] >= amount) {
					$.post(
						"https://bb-banking/withdrawEvent",
						JSON.stringify({
							amount: amount,
							account: currentModal,
						})
					);
				} else {
					showMessage("error", "Insufficient account funds", "");
				}
			} else if (currentModal == "saving") {
				if (
					eData.data["information"]["accounts"]["saving"]["amount"] >=
					amount
				) {
					$.post(
						"https://bb-banking/withdrawEvent",
						JSON.stringify({
							amount: amount,
							account: currentModal,
						})
					);
				} else {
					showMessage("error", "Insufficient account funds", "");
				}
			}
		} else {
			if (to == "quickdepomodal") {
				if (currentModal == "account") {
					if (eData.data["currentCash"] >= amount) {
						$.post(
							"https://bb-banking/depositEvent",
							JSON.stringify({
								amount: amount,
								account: currentModal,
							})
						);
					} else {
						showMessage("error", "Insufficient cash funds", "");
					}
				} else if (currentModal == "saving") {
					if (eData.data["currentAmount"] >= amount) {
						$.post(
							"https://bb-banking/depositEvent",
							JSON.stringify({
								amount: amount,
								account: currentModal,
							})
						);
					} else {
						showMessage("error", "Insufficient account funds", "");
					}
				}
			} else {
				if (to == "quicktransmodal") {
					if (id != undefined && id != "") {
						if (eData.data["currentAmount"] >= amount) {
							$.post(
								"https://bb-banking/transferEvent",
								JSON.stringify({ amount: amount, account: id })
							);
						} else {
							showMessage(
								"error",
								"Insufficient account funds",
								""
							);
						}
					} else {
						showMessage("error", "Please fill all the fields", "");
					}
				} else if (to == "pinVerification") {
					var pin = $(".pinVerification-text").val();
					if (currentCards[currentATMCard]['hold'] == 0) {
						if (pin == currentCards[currentATMCard]["pin"]) {
							$("#atm-wrapper #cards").hide();
							$("#atm-wrapper #mainatm").show();
							$("#textreplace-atmbalance").html(
								currentCards[currentATMCard]["balance"]
									.toString()
									.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
							);
						} else {
							showMessage("error", "Invalid Pin", "ATM");
						}
					} else {
						showMessage("error", "Card is disabled", "ATM");
					}
					
				} else if (to == "atmWithdraw") {
					if (parseInt(amount) && parseInt(amount) > 0) {
						if (currentCards[currentATMCard]["balance"] >= parseInt(amount)) {
							$.post(
								"https://bb-banking/cardEvent",
								JSON.stringify({
									amount: amount,
									action: "withdraw",
									card: currentCards[currentATMCard],
								})
							);
						} else {
							showMessage(
								"error",
								"Insufficient account funds",
								"ATM"
							);
						}
					} else {
						showMessage(
							"error",
							"Wrong amount",
							"ATM"
						);
					}
					
				} else if (to == "cryptoBuyModal") {
					if (eData.data["currentAmount"] >= amount) {
						$.post(
							"https://bb-banking/cryptoEvent",
							JSON.stringify({ amount: amount, event: "buy" })
						);
					} else {
						showMessage("error", "Insufficient account funds", "");
					}
				} else if (to == "cryptoSellModal") {
					if (eData.data["cryptoData"]["value"] >= amount) {
						$.post(
							"https://bb-banking/cryptoEvent",
							JSON.stringify({ amount: amount, event: "sell" })
						);
					} else {
						showMessage("error", "Insufficient crypto funds", "");
					}
				} else if (to == "walletGiveL") {
					var serverid = $(".walletgiveid-text").val();
					amount = $(".walletgiveamount-text").val();
					if (serverid != '') {
						if (currentModal == 'walletcash') {
							if (amount <= walletCash) {
								$.post("https://bb-banking/walletEvent", JSON.stringify({ amount: amount, playerid: serverid, event: "cashCheck" }))
								.then((data) => {
									showMessage(data.status, data.message, "WALLET");
								});
							} else {
								showMessage("error", "Not enough cash.", "WALLET");
							}
						} else {
							$.post("https://bb-banking/walletEvent", JSON.stringify({ card: currentWallet[parseInt(currentWALLETCard)], playerid: serverid, event: "cardCheck" }))
							.then((data) => {
								showMessage(data.status, data.message, "WALLET");
							});
						}
					} else {
						showMessage('error', 'ID Cannot be blank', "WALLET");
					}
				}
			}
		}
	}
});

$(document).on("click", ".create-visacard", function (e) {
	$(".pinset").fadeIn(250);
	$(".create-visacard .text").html("CONFIRM");
	$(".create-visacard").addClass("confirm-pinset");
	$(".create-visacard").removeClass("resetamount");
	$(".confirm-pinset").removeClass("create-visacard");
});

String.prototype.isNumber = function () {
	return /^\d+$/.test(this);
};
$(document).on("click", ".confirm-pinset", function (e) {
	var pin = $(".pinSet-text").val();
	if (pin.length == 4) {
		if (pin.isNumber()) {
			$.post(
				"https://bb-banking/createCard",
				JSON.stringify({ pin: pin })
			);
			$(".pinSet-text").val("");
			$(".pinset").hide();
			$(".confirm-pinset .text").html("CREATE");
			$(".confirm-pinset").addClass("resetamount");
			$(".confirm-pinset").addClass("create-visacard");
			$(".create-visacard").removeClass("confirm-pinset");
		} else {
			showMessage("error", "Pin can't have letters on it", "");
			$(".pinSet-text").val("");
		}
	} else {
		showMessage("error", "Pin has to be 4 Digits", "");
		$(".pinSet-text").val("");
	}
});

$(document).on("click", ".walletcard-btn-give", function (e) {
	currentWALLETCard = $(this).attr('card');
	$('#walletGiveL .walletgiveamount-text').hide();
});

$(document).on("click", ".wallet_currentcash", function (e) {
	$('#walletGiveL .walletgiveamount-text').show();
});

function showMessage(type, text, ext) {
	if (type == "success") {
		$("." + ext + "successmodal #description").html(text);
		$("#" + ext + "successModal").modal("show");
	} else {
		$("." + ext + "errormodal #description").html(text);
		$("#" + ext + "errorModal").modal("show");
	}
}
