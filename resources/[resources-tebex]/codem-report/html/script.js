window.addEventListener("message", function(event) {
    var item = event.data;
    switch (item.type) {
        case "OPEN_MENU":
            app.show = true;
            app.seciliolansayfa = 'main';
            app.seciliolanekran = 'main';
            break;
        case "GET_DATA":
            app.clienttengelenoyuncuverisi(item.playerdata, item.discord, item.playername, item.admin, item.identi, item.admindiscord, item.adminimage, item.playerimage)
            break;
        case "OPEN_CALLMENU":
            app.calldata(item.callid)
            break;
        case "USER_REFRESH_CHAT":
            app.refreshuserdata(item.data)
            break;
        case "REFRESH_ALL_DATA":
            app.refreshadminalldata(item.data)
            break
        case "USER_REPORT_DATA":
            app.refreshreportdata(item.data)
            break
        case "REFRESH_ALL_ADMINCHAT":
            app.refreshadminchat(item.data)
            break
        case "ADMIN_PROFILE":
            app.adminprofil(item.data)
            break
        case "REFRESH_ALL_CALLDATA":
          
            app.refreshcallveri(item.data)
            break
            case "LOCALES":
            app.languages(item.val)
            break
            case "send_response":
            app.response(item.resourceName)
            break
        default:
            break;
    }
  });
  
  
  
  
  const app = new Vue({
    el: "#app",
  
    data: {
        seciliolansayfa: 'main',
        reportdata: {
            reportinformation: '',
            reportheader: '',
            reportphoto: ''
        },
        playerdatasi: '',
        seciliolanekran: 'main',
        seciliolanreporticerik: '',
        playermessage: '',
        playeridentifier: '',
        playerdiscordphoto: '',
        playername: '',
        verilenyildiz: 0,
        feedbacktext: '',
        lastticketid: '',
        admin: false,
        newmessagedata: '',
        adminreportonizleme: '',
        adminreportonizlemeicerik: '',
        inputdisabled: true,
        callverisi: '',
        takecall: {},
        admininsectigisoncallid: 0,
        callchatmessage: '',
        identifier: '',
        secilencallmessage: '',
        callname: '',
        ticketacanplayername: '',
        buyuyenfotonunlinki: '',
        userinsectigicallid: 0,
        lastcallid: '',
        admindiscords: '',
        adminchat: '',
        adminchatdata: '',
        adminprofiledata: '',
        adminidentifier: '',
        adminname: '',
        callchatadminname: '',
        oyuncufoto: '',
        adminfoto: '',
        postList: [],
        search: '',
        language : {},
        show: false,
        
  
    },
    methods: {
        languages(val){
            this.language = val
            
        },

        adminprofil(val) {
            this.adminprofiledata = val
        },
        response(val){
            $.post("https://codem-report/GetResponse", JSON.stringify({}));
        },
        candisplay(val) {
  
            return this.takecall[val]
  
        },
  
        newreportPage(val, val2, val3, val4) {
          
            if (val == 'adminbugallreport') {
  
                $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                    this.adminreportonizleme = data
  
  
                });
            } else if (val == 'adminopenreport') {
  
                $.post("https://codem-report/adminreportverisi", JSON.stringify({
                    ticketid: val2
                }), (data) => {
  
                    this.adminreportonizlemeicerik = data
                });
  
            }else if (val == 'main') {
  
                this.feedbacktext = ''
  
            } else if (val == 'mycasesopebugreport') {
                $.post("https://codem-report/adminreportverisi", JSON.stringify({
                    ticketid: val2
                }), (data) => {
                    this.adminreportonizlemeicerik = data
  
                });
            } else if (val == 'mycasesopenplayerreport') {
                $.post("https://codem-report/adminreportverisi", JSON.stringify({
                    ticketid: val2
                }), (data) => {
                    this.adminreportonizlemeicerik = data
                });
            } else if (val == 'mycasesopenotherreport') {
                $.post("https://codem-report/adminreportverisi", JSON.stringify({
                    ticketid: val2
                }), (data) => {
                    this.adminreportonizlemeicerik = data
                });
            } else if (val == 'adminclosedticket') {
                $.post("https://codem-report/adminreportverisi", JSON.stringify({
                    ticketid: val2
                }), (data) => {
                    this.adminreportonizlemeicerik = data
                });
  
            } else if (val == 'anotheradminclosedreport') {
                $.post("https://codem-report/adminreportverisi", JSON.stringify({
                    ticketid: val2
                }), (data) => {
                    this.adminreportonizlemeicerik = data
                });
  
            } else if (val == 'adminprofilebugreport') {
                $.post("https://codem-report/adminreportverisi", JSON.stringify({
                    ticketid: val2
                }), (data) => {
                    this.adminreportonizlemeicerik = data
                });
  
            } else if (val == 'adminprofileplayerreport') {
                $.post("https://codem-report/adminreportverisi", JSON.stringify({
                    ticketid: val2
                }), (data) => {
                    this.adminreportonizlemeicerik = data
                });
  
            } else if (val == 'adminprofileplayerother') {
                $.post("https://codem-report/adminreportverisi", JSON.stringify({
                    ticketid: val2
                }), (data) => {
                    this.adminreportonizlemeicerik = data
                });
  
            } else if (val == 'adminprofile') {
                this.adminidentifier = val2
                this.adminname = val3
  
            } else if (val == 'adminprofilebug') {
  
                $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                    this.adminreportonizleme = data
                });
  
  
            } else if (val == 'adminprofileplayer') {
  
                $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                    this.adminreportonizleme = data
                });
  
  
            } else if (val == 'adminprofileother') {
  
                $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                    this.adminreportonizleme = data
                });
  
  
            } else if (val == 'adminlivechat') {
  
                $.post("https://codem-report/admincallsverisi", JSON.stringify(), (data) => {
                    this.callverisi = data
           
          
                });
                //  burasi benim üstüme alıyor
            } else if (val == 'adminkendilivechat') {
  
                $.post("https://codem-report/admincallsverisi", JSON.stringify(), (data) => {
                    this.callverisi = data
  
  
                });
                //  burasi benim üstüme alıyor
            } else if (val == 'farkliadminadminlivechat') {
  
                $.post("https://codem-report/admincallsverisi", JSON.stringify(), (data) => {
                    this.callverisi = data
  
  
                });
                //  burasi benim üstüme alıyor
            } else if (val == 'calladminuserchat') {
                this.admininsectigisoncallid = val2
                this.callname = val3
                $.post("https://codem-report/admincallowner", JSON.stringify({
                    callid: this.admininsectigisoncallid
                }), (data) => {
  
                    this.secilencallmessage = data
                });
  
  
            } else if (val == 'mycallscalladminuserchat') {
  
                this.admininsectigisoncallid = val2
                this.callname = val3
                $.post("https://codem-report/admincallowner", JSON.stringify({
                    callid: this.admininsectigisoncallid
                }), (data) => {
  
                    this.secilencallmessage = data
                });
  
  
            } else if (val == 'farkliadmininlivecalli') {
  
                this.admininsectigisoncallid = val2
                this.callname = val3
                $.post("https://codem-report/admincallowner", JSON.stringify({
                    callid: this.admininsectigisoncallid
                }), (data) => {
  
                    this.secilencallmessage = data
                });
  
  
            } else if (val == 'mycallscallclosedadminuserchat' || val == 'closedadminuserchat' || val == 'farkliadminclosedlivecall') {
                this.admininsectigisoncallid = val2
                this.callname = val3
                this.callchatadminname = val4
  
                $.post("https://codem-report/admincallowner", JSON.stringify({
                    callid: this.admininsectigisoncallid
                }), (data) => {
  
                    this.secilencallmessage = data
                });
  
  
            } else if (val == 'myreportcasesbugreport') {
                $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                    this.adminreportonizleme = data
                });
  
            } else if (val == 'adminplayerallreport') {
  
                $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                    this.adminreportonizleme = data
                });
            } else if (val == 'myreportcasesplayerreport') {
  
                $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                    this.adminreportonizleme = data
  
                });
            } else if (val == 'adminotherallreport') {
  
                $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                    this.adminreportonizleme = data
  
                });
            } else if (val == 'myreportcasesotherreport') {
  
                $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                    this.adminreportonizleme = data
  
                });
            } else if (val == 'adminlerarasichat') {
                $.post("https://codem-report/refreshadminchat", JSON.stringify({}), (data) => {
                    this.adminchatdata = data
  
                });
            } else if (val == 'adminuserchat') {
                $.post("https://codem-report/calluser", JSON.stringify({}));
            }
  
  
  
  
            this.seciliolansayfa = val;
            this.verilenyildiz = 0;
  
        },
  
        cancelbutton() {
            this.seciliolansayfa = 'main';
            
        },
        sendReport() {
  
            $.post("https://codem-report/sendreport", JSON.stringify({
                reportdata: this.reportdata,
                bugtype: this.seciliolansayfa,
            }));
            this.seciliolansayfa = 'main';
            this.reportdata.reportinformation = '';
            this.reportdata.reportheader = '';
            this.reportdata.reportphoto = ''
  
        },
        clienttengelenoyuncuverisi(val, discord, name, admin, identi, admindiscord, adminimage, playerimage) {
  
            this.playerdatasi = val;
  
            this.playerdiscordphoto = discord;
            this.playername = name
            this.admin = admin
            this.identifier = identi
            this.admindiscords = admindiscord
            this.adminfoto = adminimage
            this.oyuncufoto = playerimage
  
        },
        reporticerik(val) {
  
            this.playermessage = '';
            this.seciliolansayfa = 'bugreportticket';
            this.seciliolanreporticerik = val;
  
            this.lastticketid = this.seciliolanreporticerik.id
            this.ticketacanplayername = this.seciliolanreporticerik.reportdata.reportheader
  
            $.post("https://codem-report/messagefix", JSON.stringify({
                ticketid: this.seciliolanreporticerik.id
            }), (data) => {
                this.newmessagedata = data
  
            });
            this.playermessage = '';
        },
  
        playerreporticerik(val) {
            this.playermessage = '';
            this.seciliolansayfa = 'playerreportticket';
            this.seciliolanreporticerik = val;
            this.lastticketid = this.seciliolanreporticerik.id
            this.ticketacanplayername = this.seciliolanreporticerik.reportdata.reportheader
  
            $.post("https://codem-report/messagefix", JSON.stringify({
                ticketid: this.seciliolanreporticerik.id
            }), (data) => {
                this.newmessagedata = data
  
            });
            this.playermessage = '';
  
        },
        otherreporticerik(val) {
            this.playermessage = '';
            this.seciliolansayfa = 'otherreportticket';
            this.seciliolanreporticerik = val;
            this.lastticketid = this.seciliolanreporticerik.id
            this.ticketacanplayername = this.seciliolanreporticerik.reportdata.reportheader
  
            $.post("https://codem-report/messagefix", JSON.stringify({
                ticketid: this.seciliolanreporticerik.id
            }), (data) => {
                this.newmessagedata = data
  
            });
            this.playermessage = '';
        },
        playeropensendchat(val) {
            if (this.playermessage) {
                $.post("https://codem-report/sendreportmessage", JSON.stringify({
                    ticketid: val,
                    pm: this.playermessage
                }));
                this.playermessage = '';
            }
  
        },
        enterplayeropensendchat(val) {
            if (this.playermessage) {
                $.post("https://codem-report/sendreportmessage", JSON.stringify({
                    ticketid: val,
                    pm: this.playermessage
                }));
                this.playermessage = '';
            }
  
  
        },
        yildizekle(val) {
  
            this.verilenyildiz = val
        },
        closeticket() {
            if (this.lastticketid) {
                this.seciliolansayfa = 'main';
                this.seciliolanekran = 'main';
                $.post("https://codem-report/closeticket", JSON.stringify({
                    ticketid: this.lastticketid,
                    feedback: this.feedbacktext,
                    yildiz: this.verilenyildiz
                }));
                this.feedbacktext = ''
            }
        },
        closecallid() {
            this.seciliolansayfa = 'main';
  
            $.post("https://codem-report/closecall", JSON.stringify({
                ticketid: this.userinsectigicallid,
                feedback: this.feedbacktext,
                yildiz: this.verilenyildiz
            }));
            this.feedbacktext = ''
  
        },
        takecallgoster(val) {
  
            this.takecall = {}
            this.takecall[val.toString()] = true
            this.$forceUpdate();
  
        },
        sendlivechatmessage() {
       
            $.post("https://codem-report/sendlivechatmessage", JSON.stringify({
                message: this.callchatmessage,
                callid: this.admininsectigisoncallid
            }));
            this.callchatmessage = ''
  
        },
        entersendlivechatmessageuser() {
        
            if (this.callchatmessage) {
                $.post("https://codem-report/sendlivechatmessage", JSON.stringify({
                    message: this.callchatmessage,
                    callid: this.userinsectigicallid
                }));
                this.callchatmessage = ''
            }
  
        },
        entersendlivechatmessageuseradmin() {
        
          if (this.callchatmessage) {
              $.post("https://codem-report/sendlivechatmessage", JSON.stringify({
                  message: this.callchatmessage,
                  callid: this.admininsectigisoncallid
              }));
              this.callchatmessage = ''
          }
  
      },
        sendlivechatmessageuser() {
            $.post("https://codem-report/sendlivechatmessage", JSON.stringify({
                message: this.callchatmessage,
                callid: this.userinsectigicallid
            }));
            this.callchatmessage = ''
        },
        refreshuserdata(val) {
  
            this.secilencallmessage = val
        },
        endcall(val, val2) {
            if (val2 == 'admin') {
                $.post("https://codem-report/endcall", JSON.stringify({
                    callid: val
                }, ));
                this.seciliolansayfa = 'adminkendilivechat';
            } else {
  
                this.seciliolansayfa = 'closereporlivecall';
                this.lastcallid = val
            }
  
  
        },
        fotoyubuyult(val) {
            this.buyuyenfotonunlinki = val;
        },
        buyuyenfotoiptal() {
            this.buyuyenfotonunlinki = '';
        },
        calldata(val) {
  
            this.userinsectigicallid = val
            this.seciliolansayfa = 'calladminuserchat';
  
            $.post("https://codem-report/refrescallhusermessage", JSON.stringify({
                callid: val
            }), (data) => {
  
                this.secilencallmessage = data
  
            });
  
        },
        ownerreport(val) {
  
            $.post("https://codem-report/takecasereport", JSON.stringify({
                callid: val
            }));
            this.seciliolansayfa = 'main';
        },
        refreshadminalldata(val) {
            this.adminreportonizleme = val
  
        },
        refreshreportdata(val) {
  
            this.newmessagedata = val
  
        },
        sendadminarasichat(val) {
            $.post("https://codem-report/sendadminchatmessage", JSON.stringify({
                message: val
            }));
        },
        entersendadminarasichat(val) {
            if (val) {
                $.post("https://codem-report/sendadminchatmessage", JSON.stringify({
                    message: val
                }));
            }
  
        },
  
        refreshadminchat(val) {
            this.adminchatdata = val
  
            this.adminchat = '';
        },
        gotoplayer(val) {
            $.post("https://codem-report/gotoplayer", JSON.stringify({
                pid: val
            }));
        },
        bringplayer(val) {
  
            $.post("https://codem-report/bringplayer", JSON.stringify({
                pid: val
            }));
        },
        markasolved(val) {
            $.post("https://codem-report/markasolved", JSON.stringify({
                ticketid: val
            }));
            this.seciliolansayfa = 'myreportcasesbugreport'
        },
        refreshcallveri(val) {
  
            this.callverisi = val
  
        },
        searchbar() {
            this.seciliolansayfa = 'searchbarpage'
            $.post("https://codem-report/callbackreportadmin", JSON.stringify({}), (data) => {
                this.adminreportonizleme = data
                this.postList = data
            });
        },
        closereporttablet(){
            this.show = false;
            $.post("https://codem-report/close");
            
        }
  
  
  
    },
  
    computed: {
        filterByTerm() {
            if (this.search.length > 0) {
                return this.adminreportonizleme.filter((report) => {
                    return report.reporticerik.reportheader.toLowerCase().includes(this.search.toLowerCase()) || report.reporticerik.reportinformation.toLowerCase().includes(this.search.toLowerCase())
                })
            } else {
                return this.adminreportonizleme
            }
  
        }
    },
  
  
  
  
  })
  
  
  
  
  $(document).keydown(function(e) {
    if (e.keyCode == 27) {
        app.show = false;
        $.post("https://codem-report/close");
  
    }
  });