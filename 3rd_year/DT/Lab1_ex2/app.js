/*console.log("Hello JavaScript");
document.getElementById("message").innerHTML = "Message from JavaScript";
var sum = 10;
var name = "Alexandru"; var isActive = true;
var user = {id: 1, name:"Andrei", age: 21, };
var user = { "id": 1,
"name": "Alexandru Cristea", "username": "acristea", "email": "acristea@test.com", "address": {
"street": "Padin", "number": "Ap. 10", "city": "Cluj-Napoca", "zipcode": "123456", "geo": {
"lat": "46.783364",
"lng": "23.546472" }
},
"phone": "004-07xx-123456", "company": {
"name": "XYZ",
"domain": "Air Traffic Management",
"cities": ["Cluj-Napoca", "Vienna", "Paris"] }
}

console.log(user.name); 
console.log(user.address.geo.lat); 
console.log(user.company.name); 
console.dir(user.company.cities); 
console.log(user.company.cities[0]);
function print(message){ 
	console.log(message);
} 
print("hello");
var password = "123456"
console.log(password=="123456"?"ALLOW":"DENY");

var password="123456"; if(password == "123456"){
console.log("permission accepted"); } else {
console.log("permission accepted");
}
*/
/* SECOND
document.getElementById("n").addEventListener('input', inputSum);
function inputSum(){
	var inputNumber = parseInt(document.getElementById("n").value);
		sum(inputNumber);
	}


function sum(n){
	if (typeof n === 'undefined') 
			return "n is undefined"; 
		var sum = 0;
		for(var i=1;i<=n;i++){
		sum+=i; 
	}
return sum; 
} */

/*
var counter = 0;
function printValue(divId, value){ document.getElementById("divId").innerHTML = value;
}
printValue("counter", 0);
document.getElementById("inc").addEventListener("click", increment);
function increment(){
counter ++; printValue("counter", counter);
}*/


console.log("Hello JavaScript");
document.getElementById("message").innerHTML = "Message from JavaScript";

var sum = 10;
var name = "Alexandru"; var isActive = true;
var user = {id: 1, name:"Andrei", age: 21, };
var user = { "id": 1,
"name": "Alexandru Cristea", "username": "acristea", "email": "acristea@test.com", "address": {
"street": "Padin", "number": "Ap. 10", "city": "Cluj-Napoca", "zipcode": "123456", "geo": {
"lat": "46.783364",
"lng": "23.546472" }
},
"phone": "004-07xx-123456", "company": {
"name": "XYZ",
"domain": "Air Traffic Management",
"cities": ["Cluj-Napoca", "Vienna", "Paris"] }
}


console.log(user.name); 
console.log(user.address.geo.lat); 
console.log(user.company.name); 
console.dir(user.company.cities); 
console.log(user.company.cities[0]);
function print(message){ 
	console.log(message);
} 
print("hello");
var password = "123456"
console.log(password=="123456"?"ALLOW":"DENY");


var counter = 0;
function printValue(divId, value){
	$("#"+divId).html(value);
	console.log(divId);
}

printValue("counter", 0);
$("#inc").on('click', increment);
function increment(){
	if(counter<10){
	counter++;
	printValue("counter", counter);
	}
}
$("#dec").on('click', decrement);
function decrement(){
	if(counter>0){
	counter--;
	printValue("counter", counter);
	}
}