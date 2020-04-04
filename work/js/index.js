function getDate() {  
    var today = new Date();  
    var date = today.getFullYear() + "-" + twoDigits(today.getMonth() + 1) + "-" + twoDigits(today.getDate()) + " ";  
    var week = " 星期" + "日一二三四五六 ".charAt(today.getDay());  
    var time = twoDigits(today.getHours()) + ":" + twoDigits(today.getMinutes()) + ":" + twoDigits(today.getSeconds());  
    $("#remainTime").html(week+"&nbsp;&nbsp;"+date +"&nbsp;"+time);  
}  
function twoDigits(val) {  
    if (val < 10) return "0" + val; return val;  
}  
$(function () {  
    setInterval(getDate, 1000);  
});


function toEmail(title, content){
	Email.send({
	    Host : "smtp.qq.com",
	    Username : "996052600@qq.com",
	    Password : "upugyzkgonuobebc",
	    To : '996052600@qq.com',
	    From : "996052600@qq.com",
	    Subject : title,
	    Body : content
	}).then(
	  message => {
		  $('.box').hide();
		  alert(message!='OK'?'发送给老师失败！请重新填写后在发送。':'发送给老师成功！辛苦啦！'); 
	  }
	);;
}


function getPercent(num, total) {
    /// <summary>
    /// 求百分比
    /// </summary>
    /// <param name="num">当前数</param>
    /// <param name="total">总数</param>
    num = parseFloat(num);
    total = parseFloat(total);
    if (isNaN(num) || isNaN(total)) {
        return "-";
    }
    return total <= 0 ? "0%" : Math.round((num / total * 10000) / 100.00)+"%";
}


$("#submit-btn").click(function(){
	// 当天时间
	var remain_time = $('#remainTime').text();
	// 班级名
	var class_name = $('#class_name option:selected').text();
	var class_name_number = $('#class_name option:selected').val();
	// 授课老师
	var teacher = $('#teacher option:selected').text();
	var teacher_number = $('#teacher option:selected').val();
	// 授课时间
	var course_number = $('#course_number option:selected').text();
	var course_number_val = $('#course_number option:selected').val();
	// 备注
	var memo = $('#memo').val();
	// 请假人数
	var leave_number = $('#leave_number').val(); 
	// 旷课人数
	var truancy_number = $('#truancy_number').val();
	// 迟到人数
	var late_number = $('#late_number').val();
	// 早退人数
	var early_number = $('#early_number').val();
	
	if(class_name_number=='-1' && teacher_number == '-1' && course_number_val=='-1'){
		alert('请认真填写后再提交');
		return;
	}
	
	
	var total_number = parseInt(leave_number) + parseInt(truancy_number) + parseInt(late_number) + parseInt(early_number);
	var class_number=0;
	switch (parseInt(class_name_number)){
		case 1700:
			class_number = 43
			break;
		case 1801:
			class_number = 35
			break;
		case 1802:
			class_number = 34
			break;
		case 1901:
			class_number = 33
			break;
		case 1902:
			class_number = 30
			break;
		default:
			console.log("出错啦！没有匹配到对应的人数，此时人数为："+class_number);
			break;
	}
	// 出勤人数
	var out_number = class_number - total_number;
	var result = getPercent(out_number, class_number);
	
	
	var contentHtml = '<h2>重庆TTC-贵阳幼师校企合作班（软件与信息服务专业）</h2>';
	contentHtml+= '<p>';
	contentHtml+= class_name;
	contentHtml+= '在读人数'+class_number+'人，';
	contentHtml+= '应到'+class_number+'人，';
	contentHtml+= isTime(course_number_val);
	contentHtml+= '实际出勤'+out_number+'人，';
	contentHtml+= '出勤率'+result+'，';
	contentHtml+= '</p>';
	contentHtml+= '<p>';
	contentHtml+= '备注：'+memo;
	contentHtml+= '</p>';
	contentHtml+= '<h3>详情</h3>';
	contentHtml+= '<p>';
	contentHtml+= '授课老师：'+teacher;
	contentHtml+= '</p>';
	contentHtml+= '<p>';
	contentHtml+= '授课时间：'+course_number;
	contentHtml+= '</p>';
	contentHtml+= '<p>';
	contentHtml+= '请假人数：'+leave_number +'人';
	contentHtml+= '</p>';
	contentHtml+= '<p>';
	contentHtml+= '旷课人数：'+truancy_number +'人';
	contentHtml+= '</p>';
	contentHtml+= '<p>';
	contentHtml+= '迟到人数：'+late_number +'人';
	contentHtml+= '</p>';
	contentHtml+= '<p>';
	contentHtml+= '早退人数：'+early_number +'人';
	contentHtml+= '</p>';
	contentHtml+= '<p>';
	contentHtml+= '填写时间：'+remain_time;
	contentHtml+= '</p>';
	
	var title = '【每日考勤】'+class_name+'考勤';
	// 打开漫画则罩层
	$('.box').show();
	toEmail(title,contentHtml);
});



function isTime(courseNumberVal){
	switch (parseInt(courseNumberVal)){
		case 0:
			return '全天';
		case 1:
			return '上午';
		case 2:
			return '下午';
		case 3:
			return '上午';
		case 4:
			return '上午';
		case 5:
			return '下午';
		case 6:
			return '下午';
		case 7:
			return '晚上';
		case 8:
			return '晚上';
		default:
			console.info('出错啦！时间判断有问题，不为0-8，当前为：'+courseNumberVal);
			return '出错啦！时间判断有问题，不为0-8，当前为：'+courseNumberVal;
	}
}