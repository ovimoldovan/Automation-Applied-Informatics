function getFibonacci(n){
    if(typeof n != 'number') return "not a number";
    if(n<1 || n>10) return "not allowed";
    var a = [1, 1];
    for(var i=2;i<n;i++){
        a[i] = parseInt(a[i-1]) + parseInt(a[i-2]);
    }
    return a;
}

console.log(getFibonacci(5));
console.log(getFibonacci("a"));
console.log(getFibonacci(12));