function dolike(pid,uid){
	console.log(pid+"---"+uid)
	const d={
		uid:uid,
		pid:pid,
		operation:'like'
	}
		$.ajax({
			url:"likeservlet",
            data: d,
			success:function(data,textStatus,jqXHR){
				console.log(data);
				if (data.trim() == 'true')
            {
                let c = $(".likecounter").html();
                c++;
                $('.likecounter').html(c);
            }
			},
			error:function(jqXHR,textStatus,errorThrown){
				console.log(data)
			}
		})
}