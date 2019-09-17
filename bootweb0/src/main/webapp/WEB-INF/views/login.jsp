<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<style>
.btn-facebook {
color: #fff;
background: #3B5998;
}
.btn-github {
color: #fff;
background: #000000;
}

.btn-google {
color: #fff;
background: #EB0000;
}

.btn-naver {
color: #fff;
background: #2DB400;
}

.btn-sns{
	 
	  border-radius: 10;
	  border-width: 1px;
	  border-style: solid;
	  border-color: #263961; 
	}
	/* .btn-facebook:link, .btn-facebook:visited {
	  color: #fff;
	}
	.btn-facebook:active, .btn-facebook:hover {
	  background: #263961;
	  color: #fff;
	} */
	.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.42;
  border-radius: 15px;
}
	.btn-circle-lg {
  width: 40px;
  height: 40px;
  text-align: center;
  font-size: 12px;
  line-height: 1.42;
  border-radius: 90%;
}

</style>

  <fieldset>
  <legend id = "sns_login" class = "btn btn-lg btn-outline-dark">SNS로 로그인</legend>

<form id = "sns_form">
  <div class = "form-group">
  <div align="center"> 
		<button title="Facebook" class="btn btn-circle btn-facebook"><i class="fa fa-facebook fa-lg"></i> </button> &nbsp;
		<button  title="Google" class="btn btn-circle btn-google"><i class="fa fa-google fa-lg"></i> </button> &nbsp;
		<button  title="Naver" class="btn btn-circle btn-naver"><span style="font-size: 100%">N</span></button> &nbsp;
		<button  title="GitHub" class="btn btn-circle btn-github"><i class="fa fa-github fa-lg"></i> </button> &nbsp;
	</div>
  </div>
</form>  

	<hr>
  <legend id = "email_login" class = "btn btn-lg btn-outline-dark">이메일로 로그인</legend>
<div id = "email_form">
<form>
	<div>
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="login_email" aria-describedby="emailHelp" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="login_pw" placeholder="Password">
    </div>
	</div>
</form>

   
<div align="right">
        <button type="button" class="btn btn-primary btn-modal-save" id= "login_submit">login</button>
</div>
</div>

  </fieldset>
  <br>
<!--         <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div> -->
      
 <script type="text/javascript">
 $(function () {
		$("#email_form").hide();
		$("#sns_form").show();
	$("#sns_login").click(function() {
		$("#email_form").hide();
		$("#sns_form").show();
	})
	
	$("#email_login").click(function() {
		$("#sns_form").hide();
		$("#email_form").show();
	})
	
	
})
 
 </script>     
      