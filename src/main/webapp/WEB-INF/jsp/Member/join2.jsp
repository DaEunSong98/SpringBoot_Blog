<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>

<body> 
<h2>회원가입</h2>


<input type="hidden" id="encPswd" name="encPswd" value="717cb8bd098f2dea2f688ec18beaa9bd8de54424bdd066628d0c2dbd9cc6b57a727dd2ef0d17742b27771a7c3834f9fd423fb82525294d9d5cb984e9ae8de9c490c2fddaed007a52b86cab000c04dbc1f192e3f497faa6c3ea41a5179869cbc26fd5a3367b250ca71d83d4623623f1a9787bbf286b7def2d7095cdf242852ddb">


    //region define, setter
    var idFlag = false;
    var pwFlag = false;
    var authFlag = false;
    var submitFlag = false;

    var properties = {
        keyboard: [{id:"id"}, {id:"pswd1", secureMode:true}, {id:"pswd2", secureMode:true}],
        modeProperties: {
            mode: 4
        }
    };
    var desk = new sofa.Koop(properties);

    $(document).ready(function() {
        defaultScript();

        if ($("#yy").val() != "") {
            checkBirthday();
        }

        //region unreal id
        $("#id").blur(function() {
            idFlag = false;
            checkId("first");
        });

        $("#pswd1").blur(function() {
            pwFlag = false;
            checkPswd1();
        }).keyup(function(event) {
            checkShiftUp(event);
        }).keypress(function(event) {
            checkCapslock(event);
        }).keydown(function(event) {
            checkShiftDown(event);
        });

        $("#pswd2").blur(function() {
            checkPswd2();
        }).keyup(function(event) {
            checkShiftUp(event);
        }).keypress(function(event) {
            checkCapslock2(event);
        }).keydown(function(event) {
            checkShiftDown(event);
        });

        $("#name").blur(function() {
            checkName();
        });

        $("#name1").blur(function() {
            checkName();
        });

        $("#name2").blur(function() {
            checkName();
        });

        $("#yy").blur(function() {
            checkBirthday();
        });

        $("#mm").change(function() {
            checkBirthday();
        });

        $("#dd").blur(function() {
            checkBirthday();
        });

        $("#gender").change(function() {
            checkGender();
        });

        $("#email").blur(function() {
            checkEmail();
        });

        $("#phoneNo").blur(function() {
            checkPhoneNo();
        });

        $("#btnSend").click(function() {
            sendSmsButton();
            return false;
        });

        $("#authNo").blur(function() {
            authFlag = false;
            checkAuthNo();
        });

        $("#tabPrtsMobile").click(function() {
            showJuniverMobileTab();
            return false;
        });

        $("#tabPrtsIpin").click(function() {
            showJuniverIpinTab();
            return false;
        });
        //endregion

        //region prts mobile
        $("#pagree_all").click(function() {
            setPrtsTerms();
        })
        $("#pagree_01").click(function() {
            viewPrtsTerms();
        })
        $("#pagree_02").click(function() {
            viewPrtsTerms();
        })
        $("#pagree_03").click(function() {
            viewPrtsTerms();
        })
        $("#pagree_04").click(function() {
            viewPrtsTerms();
        })
        $("#pagree_05").click(function() {
            viewPrtsTerms();
        })

        $("#pname").blur(function() {
            checkPrtsName();
        });

        $("#pyy").blur(function() {
            checkPrtsBirthday();
        });

        $("#pmm").change(function() {
            checkPrtsBirthday();
        });

        $("#pdd").blur(function() {
            checkPrtsBirthday();
        });

        $("#pgender").change(function() {
            checkPrtsGender();
        });

        $("#pphoneNo").blur(function() {
            checkPrtsPhoneNo();
        });

        $("#btnPrtsSend").click(function() {
            sendPrtsSmsButton();
            return false;
        })

        $("#pauthNo").blur(function() {
            authFlag = false;
            checkPrtsAuthNo();
        });
        //endregion

        //region ipin popup
        $("#iagree_all").click(function() {
            checkIpinAgree();
        });

        $("#btnIpinPopup").click(function() {
            openIpinPopup();
        });

        $("#iphoneNo").blur(function() {
            checkIpinPhoneNo();
        });

        $("#btnIpinSend").click(function() {
            sendIpinSmsButton();
            return false;
        })

        $("#iauthNo").blur(function() {
            authFlag = false;
            checkIpinAuthNo();
        });
        //endregion

        $("#btnJoin").click(function(event) {
            clickcr(this, 'sup.signup', '', '', event);
            submitClose();
            if(idFlag && pwFlag && authFlag) {
                mainSubmit();
            } else {
                setTimeout(function() {
                    mainSubmit();
                }, 700);
            }
        });

    });
    //endregion

    //region mainSubmit
    function mainSubmit() {
        var joinMode = $("#joinMode").val();

        if(joinMode == "juniverMobile") {
            if (!checkPrtsMobileInput()) {
                submitOpen();
                return false;
            }
        } else if(joinMode == "juniverIpin") {
            if (!checkPrtsIpinInput()) {
                submitOpen();
                return false;
            }
        } else {
            if (!checkUnrealInput()) {
                submitOpen();
                return false;
            }
        }

        if(idFlag && pwFlag && authFlag) {
            try {
                desk.f(function(a) {
                    $("#nid_kb2").val(a);
                    $("#join_form").submit();
                });
            } catch (e) {
                $("#nid_kb2").val("join v2 error: " + e.name + ", " + e.message);
                $("#join_form").submit();
            }
        } else {
            submitOpen();
            return false;
        }
    }

    function checkUnrealInput() {
        if (checkId('join')
                & checkPswd1()
                & checkPswd2()
                & checkName()
                & checkBirthday()
                & checkGender()
                & checkEmail()
                & checkPhoneNo()
                & checkAuthNo()
        ) {
            return true;
        } else {
            return false;
        }
    }

    function checkPrtsMobileInput() {
        if (checkId('join')
                & checkPswd1()
                & checkPswd2()
                & checkName()
                & checkBirthday()
                & checkGender()
                & checkEmail()
                & checkPrtsAgree()
                & checkPrtsName()
                & checkPrtsBirthday()
                & checkPrtsGender()
                & checkPrtsPhoneNo()
                & checkPrtsAuthNo()
        ) {
            return true;
        } else {
            return false;
        }
    }

    function checkPrtsIpinInput() {
        if (checkId('join')
                & checkPswd1()
                & checkPswd2()
                & checkName()
                & checkBirthday()
                & checkGender()
                & checkEmail()
                & checkIpinAgree()
                & checkIpinPopup()
                & checkIpinPhoneNo()
                & checkIpinAuthNo()
        ) {
            return true;
        } else {
            return false;
        }
    }
    //endregion

    //region unreal 가입
    function checkId(event) {
        if(idFlag) return true;

        var id = $("#id").val();
        var oMsg = $("#idMsg");
        var oInput = $("#id");

        if ( id == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            setFocusToInputObject(oInput);
            return false;
        }

        var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
        if (!isID.test(id)) {
            showErrorMsg(oMsg,"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
            setFocusToInputObject(oInput);
            return false;
        }

        idFlag = false;
        $.ajax({
            type:"GET",
            url: "/user2/joinAjax?m=checkId&id=" + id ,
            success : function(data) {
                var result = data.substr(4);

                if (result == "Y") {
                    if (event == "first") {
                        showSuccessMsg(oMsg, "멋진 아이디네요!");
                    } else {
                        hideMsg(oMsg);
                    }
                    idFlag = true;
                } else {
                    showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다.");
                    setFocusToInputObject(oInput);
                }
            }
        });
        return true;
    }

    function checkPswd1() {
        if(pwFlag) return true;

        var id = $("#id").val();
        var pw = $("#pswd1").val();
        var oImg = $("#pswd1Img");
        var oSpan = $("#pswd1Span");
        var oMsg = $("#pswd1Msg");
        var oInput = $("#pswd1");

        if (pw == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            setFocusToInputObject(oInput);
            return false;
        }
        if (isValidPasswd(pw) != true) {
            showPasswd1ImgByStep(oImg, oSpan, 1);
            showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
            setFocusToInputObject(oInput);
            return false;
        }

        pwFlag = false;
        $.ajax({
            type:"GET",
            url: "/user2/joinAjax?m=checkPswd&id=" + escape(encodeURIComponent(id)) + "&pw=" + escape(encodeURIComponent(pw)) ,
            success : function(data) {
                var result = data.substr(4);
                if (result == 1) {
                    showPasswd1ImgByStep(oImg, oSpan, 1);
                    showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                    setFocusToInputObject(oInput);
                    return false;
                } else if (result == 2) {
                    showPasswd1ImgByStep(oImg, oSpan, 2);
                    showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                    setFocusToInputObject(oInput);
                } else if (result == 3) {
                    showPasswd1ImgByStep(oImg, oSpan, 3);
                    oMsg.hide();
                } else if (result == 4) {
                    showPasswd1ImgByStep(oImg, oSpa…