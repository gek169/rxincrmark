
	

busy = function(x){
	let i = 0;
	while(i < x){
		i = i + 1;
	}
	return;
}


let ti = Date.now();
busy(0xffFFffFF)
ti = Date.now() - ti;

console.log('milliseconds = ',ti);
