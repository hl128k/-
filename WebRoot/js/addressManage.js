// JavaScript Document
$(function() {
	$("select")
			.change(
					function() {
						var thisid = this.id;
						var thisValue = this.value;
						var nextid;
						if (thisid != "street") {
							if (thisid == "province") {
								nextid = "city";
								$("#street")
										.html(
												"<option value='-1' selected='selected'>-----请选择-----</option>");
							} else {
								nextid = "street";
							}
							$("#street").val(-1)
							$.ajax({
								url : 'GetaddressList',
								method : 'post',
								data : {
									ParentId : thisValue,
									nextid : nextid
								},
								dataType : 'html',
								success : function(data) {
									$("#" + nextid).html(data);
								},
								error : function(xhr, msg) {
									alert("服务器出错了！");
								}
							});
						}
					});

	$("#tianjiadizhiTit").click(function() {
		$("#tianjiadizhi").slideDown(200);
	});
	$("#shdzquxiao").click(function() {
		$("#tianjiadizhi").slideUp(200);
	});

	$("#yonghudizhi").on("mouseover", ".addUser", function() {
		$(this).children(".userControl").show();
	});
	$("#yonghudizhi").on("mouseout", ".addUser", function() {
		$(this).children(".userControl").hide();
	});
	$("#yonghudizhi").on("click", ".del", function() {
		var thisHtml = $(this);
		$.ajax({
			url : 'delAddress',
			method : 'post',
			data : {
				no : $(this).parent().parent().find(".no").val()
			},
			dataType : 'html',
			success : function(data) {
				if (data == "true")
					thisHtml.parent().parent().remove();
				else
					alert("请刷新！");
			},
			error : function(xhr, msg) {
				alert("服务器出错了！");
			}
		});
	});
	$("#tianjiadizhiBox :text").blur(function() {
		var thisName = $(this).get(0).id;
		var thisValidation;
		var reg;
		switch (thisName) {
		case "addName":
			thisValidation = $(this).val() !== "";
			break;
		case "addTel":
			reg = /^[1][358][0-9]{9}$/;
			thisValidation = reg.test($(this).val());
			break;
		case "addAdd":
			thisValidation = $(this).val() !== "";
			break;
		}
		if (thisValidation) {
			$(this).get(0).className = "";
			$(this).parent().children("span").hide();
		} else {
			$(this).get(0).className = "error";
			$(this).parent().children("span").show();
		}
	});
	$("#shdzbaocun").click(
			function() {
				var notPoss = "";
				$("#tianjiadizhiBox input[type='text']:lt(2)").each(function() {
					var className = $(this).get(0).className;
					if ($(this).val() === "" || className === "error") {
						$(this).get(0).className = "error";
						$(this).parent().children("span").show();
						notPoss = $(this).get(0).tagName;
					}
				});
				if ($("#street").val() === "-1" || $("#addAdd").val() === "") {
					$("#addAdd").get(0).className = "error";
					$("#addAdd").parent().children("span").show();
					notPoss = $(this).get(0).id;
				}
				if (notPoss === "") {
					var user = $("#addName").val();
					var phone = $("#addTel").val();

					var add = $("#province").find('option:selected').text()
							+ $("#city").find('option:selected').text()
							+ $("#street").find('option:selected').text()
							+ $("#addAdd").val();

					$.ajax({
						url : 'addAddress',
						method : 'post',
						data : {
							Name : user,
							uId : '1',
							Phone : phone,
							address : add
						},
						dataType : 'html',
						success : function(data) {
							$("#yonghudizhi").append(data);
							$("#addName").val("");
							$("#addTel").val("");
							$("#addAdd").val("");
							$("#tianjiadizhi").slideUp(200);
						},
						error : function(xhr, msg) {
							alert("服务器出错了！");
						}
					});
				}
			});
});
