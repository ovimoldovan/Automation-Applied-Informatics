/* script.js */
var counter = 0;
var MIN_VAL = -50;
var MAX_VAL = 50;
refresh();

function refresh(){
	$("#counter").text(counter);
}


function inc(){
  counter++;
  if(counter>MIN_VAL) counter=MIN_VAL;
  refresh();
}

function dec(){
  counter--;
  if(counter<-MAX_VAL) counter=-MAX_VAL;
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

// CALCULATOR FRUMOS, nu neaparat frumos codat


var currentValue = 0;
var currentResult = 0;
var relation = 'a';


function printCurrentValue(){
	$("#screen").text(currentValue);
}
function printCurrentResult(){
	$("#screen").text(currentResult);
}


function b1(){
	currentValue = currentValue*10+1;
	printCurrentValue();
}
function b2(){
	currentValue = currentValue*10+2;
	printCurrentValue();
}
function b3(){
	currentValue = currentValue*10+3;
	printCurrentValue();
}
function b4(){
	currentValue = currentValue*10+4;
	printCurrentValue();
}
function b5(){
	currentValue = currentValue*10+5;
	printCurrentValue();
}
function b6(){
	currentValue = currentValue*10+6;
	printCurrentValue();
}
function b7(){
	currentValue = currentValue*10+7;
	printCurrentValue();
}
function b8(){
	currentValue = currentValue*10+8;
	printCurrentValue();
}
function b9(){
	currentValue = currentValue*10+9;
	printCurrentValue();
}

function add(){
	currentResult = currentResult + currentValue;
	currentValue = 0;
	printCurrentResult();
	relation = '+';
}

function clearAll(){
	currentValue = 0; 
	currentResult = 0; 
	printCurrentValue();
	relation = 'a';
	console.log(currentValue);
}

function equals(){
	if(relation=='+') add();
		else printCurrentResult();
}