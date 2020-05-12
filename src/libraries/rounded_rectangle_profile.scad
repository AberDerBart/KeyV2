function sign_x(i,n) =
	i < n/4 || i > n*3/4  ?  1 :
	i > n/4 && i < n*3/4  ? -1 :
	0;

function sign_y(i,n) =
	i > 0 && i < n/2  ?  1 :
	i > n/2 ? -1 :
	0;


function rectangle_profile(size=[1,1],fn=32) = [
	for (index = [0:fn-1])
		let(a = index/fn*360)
			sign_x(index, fn) * [size[0]/2,0]
			+ sign_y(index, fn) * [0,size[1]/2]
];

function rounded_rectangle_profile(size=[1,1],r=1,fn=32) = [
	let(max_fn = max(fn,8))
		for (index = [0:max_fn-1])
			let(a = index/max_fn*360)
				r * [cos(a), sin(a)]
				+ sign_x(index, max_fn) * [size[0]/2-r,0]
				+ sign_y(index, max_fn) * [0,size[1]/2-r]
];

function double_rounded_rectangle_profile(size=[1,1], r=1, fn=32) = [
	let(max_fn = max(fn,8))
		for (index = [0:max_fn-1])
			let(a = index/max_fn*360)
				r * [cos(a), sin(a)]
				+ sign_x(index, max_fn) * [size[0]/2-r,0]
				+ sign_y(index, max_fn) * [0,size[1]/2-r]
];
