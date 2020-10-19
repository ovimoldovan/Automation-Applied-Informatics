/* script.js */
var counter = 0;
refresh();

function refresh(){
	$("#counter").text(counter);
}


function inc(){
  counter++;
  if(counter>50) counter=50;
  refresh();
}

function dec(){
  counter--;
  if(counter<-50) counter=-50;
  refresh();
}

var res,a,b;

function print(){
	$("#result").text(res);
}

function getNumbers(){
	a = parseInt($("#a").val());
	b = parseInt($("#b").val());
	return {a:a,b:b}
}

/*function add(){
	console.log(getNumbers().a);
	getNumbers();
	res = a+b;
	print();
} 
function subtract(){
	res = getNumbers().a-getNumbers().b;
	print();
}*/

function printResult(){
	var test = $("#type").val();
	console.log(test);
	switch(test){
		case '+': 
			res = getNumbers().a+getNumbers().b;
			print();
			break;
		case '-': 
			res = getNumbers().a-getNumbers().b;
			print();
			break;
		case '/':
			res = getNumbers().a/getNumbers().b;
			print();
			break;
		case '*':
			res = getNumbers().a*getNumbers().b;
			print();
			break;
		case '%':
			res = getNumbers().a%getNumbers().b;
			print();
			break;
		default:
			res = 0;
		break;
	}
}
