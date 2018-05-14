<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/verify.css">
    <style type="text/css">
        /*登录页面包裹层单独样式*/
        .main-container,
        .mask {
            height: 300px;
            margin-top: -150px;
        }

        /*登录按钮单独样式*/
        .register-btn {
            position: absolute;
            bottom: 25px;
            left: 140px;
        }

        .check-num-pic {
            width: 150px;
            height: 45px;
            /*border: 1px solid #000;*/
            display: inline-block;
            position: absolute;
            right: 42%;
            bottom: -25px;
            border-radius: 3px;
        }

        .register-link {
            position: absolute;
            right: 50px;
            bottom: 35px;
        }
    </style>
</head>
<body>
<div class="main-container-wrap">
    <div class="main-container">
        <h1 class="register-title">登录</h1>
        <ul class="register-content">
            <li class="register-item">
                <span>账号</span>
                <input type="text" id="phoneNum" class="common-input" placeholder="请输入手机号">
            </li>
            <li class="register-item">
                <span>密码</span>
                <input type="password" id="psw" class="common-input" placeholder="请输入密码">
            </li>
            <li class="register-item">
                <span>验证码</span>
                <div id="verifyBtn" class="check-num-pic"></div>
                <!-- <input type="text" id="checkNum" class="check-num-input common-input" placeholder="请输入验证码"> -->
            </li>
            <a href="#" class="register-link">重置</a>
        </ul>
        <button id="logIn" class="register-btn common-btn">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
    </div>
    <!-- 按钮遮罩层 -->
    <div class="mask"></div>
    <div id="select-item" class="select-item">

    </div>
    <!-- 弹出层的遮罩层 -->
    <div id="select-mask" class="select-mask"></div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
<script type="text/javascript" src="../../js/verify.min.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        const logIn = $("#logIn");
        const phoneNum = $("#phoneNum");
        const psw = $("#psw");
        const checkNum = $("#checkNum");
        const buy = $("#buy");
        const sell = $("#sell");
        const verifyBtn = $('#verifyBtn');
        var uuid = ""
        var state = 1;

        logIn.on("click", function() {
            // console.log(this.innerText);
            // 如果表单某个输入项为空，弹出提示
            if (phoneNum.val() === "" ||
                    psw.val() === "" ||
                    checkNum.val() === "" ) {
                alert("请完善信息！");
            } else {

            }
        });

        // 隐藏选择买卖按钮


        // 引入验证码插件
        verifyBtn.codeVerify({
            type : 1,
            width : '150px',
            height : '45px',
            fontSize : '30px',
            codeLength : 4,
            btnId : 'logIn',   // 选择点击触发事件的按钮
            ready : function() {
            },
            success : function(data) {
                // 如果表单某个输入项为空，弹出提示
                if (phoneNum.val() === "" ||
                        psw.val() === "" ||
                        checkNum.val() === "" ) {
                    hideSelectBtn();
                    alert("请完善信息！");
                } else {
                    // 将username和password传递到后台

                    $.ajax({
                        type:'POST',
                        url:'http://127.0.0.1:8080/sys/login',
                        data:{
                            username: phoneNum.val(),
                            password: psw.val()
                        },
                        dataType:'JSON',
                        headers : { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                        success:function(data){

                        },
                        error:function(){
                            //失败之后的操作
                        }
                    });
                }
            },
            error : function() {
//                hideSelectBtn();
                alert('验证码不匹配，请重新输入！');
            }
        });


    });
</script>
</body>
</html>