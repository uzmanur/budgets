var defaultCat = new Category("Budget", 100);
var categories = [defaultCat];
var transactions = [];
var deposits = [];
var withdrawals = [];

/////

// category class
function Category(s, i) {
  this.name = s;
  this.percent = i;
}
	
Category.prototype.getName = function() { return this.name; };
Category.prototype.getPercent = function() { return this.percent; };
	
Category.prototype.setName = function(s) { this.name = s; };
Category.prototype.setPercent = function(i) { this.percent = i; };

/////

// transaction class
function Transaction(m, d, y, f, s) {
  this.month = m;
	this.day = d;
	this.year = y;
	this.amount = f;
	this.descr = s;
}
	
Transaction.prototype.getDate = function() { return this.month + "/" + this.day + "/" + this.year; };
Transaction.prototype.getAmount = function() { return this.amount; };
Transaction.prototype.getDescr = function() { return this.descr; };

Transaction.prototype.setDate = function(m, d, y) { 
  this.month = m; 
  this.day = d;
	this.year = y;
};
Transaction.prototype.setAmount = function(f) { this.amount = f; };
Transaction.prototype.setDescr = function(s) { this.descr = s; };

/////

//categories.push(defaultCat);
// if (categories.length() > 1) {
//   var sum = 0;
//   for (var i = 1; i < categories.length(); i++) {
//     sum += categories[i].getPercent();
//   }
//   if (sum == 100) { categories.delete(defaultCat); }
//   else { 
//     defaultCat.setName("Remainder");
//     defaultCat.setPercent(100-sum);
//   }
// }

/////

// homescreen
setScreen("homescreen");
setProperty("homescreen", "background-color", rgb(207, 181, 59, 0.5));

var w = 320;
var bw = 200;
var bh = 40;
var m = (w-bw)/2;

button("button1", "See your budgets");
setProperty("button1", "background-color", rgb(34, 139, 50));
setProperty("button1", "width", bw);
setProperty("button1", "height", bh);
setProperty("button1", "x", m);
setProperty("button1", "y", m);
onEvent("button1", "click", function() { setScreen("totals"); });

button("button2", "Make a transaction");
setProperty("button2", "background-color", rgb(26, 188, 156));
setProperty("button2", "width", bw);
setProperty("button2", "height", bh);
setProperty("button2", "x", m);
setProperty("button2", "y", 80);
onEvent("button2", "click", function() { setScreen("makeTransaction"); });

button("button3", "See all transactions");
setProperty("button3", "background-color", rgb(10, 117, 222));
setProperty("button3", "width", bw);
setProperty("button3", "height", bh);
setProperty("button3", "x", m);
setProperty("button3", "y", 100);
onEvent("button3", "click", function() { setScreen("listTransactions"); });

button("button4", "Create a category");
setProperty("button4", "background-color", rgb(100, 95, 220));
setProperty("button4", "width", bw);
setProperty("button4", "height", bh);
setProperty("button4", "x", m);
setProperty("button4", "y", 120);
onEvent("button4", "click", function() { setScreen("newCategory"); });

button("button5", "Edit your categories");
setProperty("button5", "background-color", rgb(208, 32, 144));
setProperty("button5", "width", bw);
setProperty("button5", "height", bh);
setProperty("button5", "x", m);
setProperty("button5", "y", 140);
onEvent("button5", "click", function() { setScreen("editCategory"); });

var cat1 = new Category("Long-term savings", 10);
categories.push(cat1)

// totals page
setScreen("totals");
setProperty("totals", "background-color", rgb(34, 139, 50, 0.25));
button("home1", "Back to menu");
setProperty("home1", "background-color", rgb(207, 181, 59));
onEvent("home1", "click", function() { setScreen("homescreen"); });
for (var i = 0; i < categories.length; i ++) {
  textLabel("category" + i, categories[i].getName());
  setProperty("category" + i, "x", 0)
  setProperty("category" + i, "y", 60 + 25*i)
}



// make transaction page
setScreen("makeTransaction");
setProperty("makeTransaction", "background-color", rgb(26, 188, 156, 0.25));
button("home2", "Back to menu");
setProperty("home2", "background-color", rgb(207, 181, 59));
onEvent("home2", "click", function() { setScreen("homescreen"); });


// transaction list page
setScreen("listTransactions");
setProperty("listTransactions", "background-color", rgb(10, 117, 222, 0.25));
button("home3", "Back to menu");
setProperty("home3", "background-color", rgb(207, 181, 59));
onEvent("home3", "click", function() { setScreen("homescreen"); });


// new category page
setScreen("newCategory");
setProperty("newCategory", "background-color", rgb(100, 95, 220, 0.25));
button("home4", "Back to menu");
setProperty("home4", "background-color", rgb(207, 181, 59));
setProperty("home4", "x", 0);
setProperty("home4", "y", 0);
onEvent("home4", "click", function() { setScreen("homescreen"); });
textInput("categoryName", "");
var w1 = 200;
var h1 = 30;
setProperty("categoryName", "x", (320-w1)/2);
setProperty("categoryName", "y", 450/2-2*h1);
setProperty("categoryName", "placeholder", "Category name");


// edit category page
setScreen("editCategory");
setProperty("editCategory", "background-color", rgb(208, 32, 144, 0.25));
button("home5", "Back to menu");
setProperty("home5", "background-color", rgb(207, 181, 59));
onEvent("home5", "click", function() { setScreen("homescreen"); });

setScreen("homescreen");
