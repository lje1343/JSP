<%@page import="mail.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>유저 등록</title>
<link type="text/css" rel="stylesheet" href="../css/default.css" />

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/default.js"></script>



    <style>
        .tabmanu {
            margin: auto;
            width: 50%;
            height: 450px;
            border: 1px solid #666666;
        }

        .tabBtnCell {
            display: flex;
            justify-content: flex-start;
        }

        label[for^='btn'] {
            width: 50%;
            padding: 10px;
            height: 45px;
            background: #666666;
            color: #ffffff;
            text-align: center;
        }

        div[id^="content"] {
            display: none;
            width: 100%;
            height: 200px;
            padding: 10px;
        }

        div[id^="content"].on {
            display: block;
        }

        .tabBtnCell>label[for^='btn']:hover {
            background: #e5e5e5;
            color: #666666;
        }

        .tabBtnCell>input[id^='btn']:checked+label {
            background: #ffffff;
            color: #666666;
        }
        
    </style>
    
    <link href="useradd.css" rel="stylesheet" type="text/css">
    
    <script>
        $(document).ready(function () {
            //tab manu 컨트롤
            $('.tabBtnCell > input').click(function () {
                var tab_id = $(this).attr('data-tab');
                $('.tabCell>div[id^="content"]').removeClass('on');
                $('#' + tab_id).addClass('on');
            })
        })

    </script>
</head>



<body>
    <div class="wrap">
        <!-- header-->
        <header id="admheader">

        </header>

        <!-- hidden nav-->
        <nav id="admnav"></nav>

        <main>
            <div class="mainWrap">
                <section class="sec1">
                    <!-- form 태그-->
                     <form action="useradddb.jsp" method="post" name="signUpForm" enctype="multipart/form-data" accept-charset="UTF-8" class="frm">

                        <div class="boardCell">			
			
				<div class="roww">
					<div>
						<label class="lab">이메일<em> * </em></label>
					</div>
					<div class="inputbox">
					<input type="email" name="user_email" id="user_email" placeholder="이메일을 입력해주세요.">
					</div>
					<div> 
					<input type="button" value="Email 중복확인" onclick="emailCheck()">
					</div>
					<div>
					<input type="button" value="Email 메일인증" onclick="emailAuth()"> <!-- disabled id="dischk" -->
					</div>
				</div>


				<div class="roww">
					<div>
						<label class="lab">비밀번호<em> * </em></label>
					</div>
					<div class="inputbox">
						<input type="text" id="pw" onchange="check_pw()" name="user_pw"placeholder="비밀번호를 입력해주세요.">
					</div>
				</div>


				<div class="roww">
					<div>
						<label class="lab">비밀번호 확인<em> * </em></label>
					</div>
					<div class="inputbox">
						<input type="text" id="pw2" onchange="check_pw()"placeholder="비밀번호를 확인해주세요.">
					&nbsp;<span id="check"></span>
					</div>
				</div>

			
				<div class="roww">
					<div>
						<label class="lab">이름<em> * </em></label>
					</div>
					<div class="inputbox">
						<input type="text" name="user_name" class="form-control"placeholder="이름을 입력해주세요.">
					</div>
				</div>

				

			<div class="roww">
				<div>
				<label class="lab">성별<em> * </em></label>
				</div>
				<div class="inputbox">
				<div class="col-sm-3">
					<div class="form-check form-check-inline">
					  <input name="user_gender" class="form-check-input" type="radio" id="inlineCheckbox1" value="M">
					  <label class="form-check-label" for="inlineCheckbox1" style="margin-right:100px">남성</label>
					  <input name="user_gender" class="form-check-input" type="radio" id="inlineCheckbox2" value="F">
					  <label class="form-check-label" for="inlineCheckbox2">여성</label>
					</div>
				</div>
				</div>
			</div>


			<div class="roww">
				<div>
					<label class="lab">생년월일<em> * </em></label>
				</div>
				<div class="inputbox">
					<input type="text" name="user_birth" class="form-control" placeholder="생년월일을 입력해주세요.">
				</div>
			</div>
			
							<div class="roww">
				<div>
					<label class="lab">전화번호<em> * </em></label>
				</div>
				<div class="inputbox">
					<input type="text" name="user_phone" class="form-control" placeholder="전화번호를 입력해주세요.">
				</div>
			</div>
				
			

<!-- 우편번호/주소/상세주소 api -->

<div class="roww">
	<div>
		<label class="lab">우편번호<em> * </em></label>
	</div>
	<div class="inputbox">
	<input type="text" id="zipbox" name="user_zipcode" placeholder="우편번호를 입력해주세요.">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 검색">
	</div>
</div>				


<div class="roww">
	<div>
		<label class="lab">주소<em> * </em></label>
	</div>
	<div class="inputbox">
	<input type="text" id="sample6_address" name="user_addr" placeholder="주소를 입력해주세요.">
	</div>
</div>


<div class="roww">
	<div>
		<label class="lab">상세주소<em> * </em></label>
	</div>
	<div class="inputbox">
	<input type="text" id="sample6_detailAddress" name="user_addrdetail" placeholder="상세주소를 입력해주세요.">
	</div>
</div>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

			
                            <!-- 상단 입력-->
                            상단 입력
                        </div>
                        <!-- 하단 입력-->
                        <div class="tabmanu">
                            <div class="tabCell">
                                <div class="tabBtnCell">
                                    <input type="radio" id="btn1" name="mb_type" class="hidden" data-tab="content1"
                                        checked>
                                    <label for="btn1">트레이너</label>
                                    <input type="radio" id="btn2" name="mb_type" class="hidden" data-tab="content2">
                                    <label for="btn2">핼스장</label>
                                </div>

                                <div class="on" id="content1">
                                    내용1
                                </div>

                                <div class="" id="content2">
                                    내용2
                                </div>

                            </div>

                        </div>
                        
                        			<div>
				<div class="subbtn">
					<input type="submit" class="btn btn-primary" value="등록" disabled id="dischk">
					</div>
			</div>	
			
                    </form>
                </section>
            </div>
        </main>

        <footer id="footer">

        </footer>

        <!-- side butten -->
        <article id="sideBtn">
            <div class="sideLinkWrap">
                <label id="" for="">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
            </div>
        </article>
    </div>
</body>

</html>