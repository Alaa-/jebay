
<html>
<body>
<script>

//Countdown script by Mike Thompson
//http://www.members.tripod.com/webdesign123now/
//Based on script by Website Abstraction (http://wsabstract.com)

var montharray=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

function countdown(yr,m,d){
var today=new Date()
var todayy=today.getYear()
if (todayy < 1000)
todayy+=1900
var todaym=today.getMonth()
var todayd=today.getDate()
var todaystring=montharray[todaym]+" "+todayd+", "+todayy
var futurestring=montharray[m-1]+" "+d+", "+yr
var difference=(Math.round((Date.parse(futurestring)-Date.parse(todaystring))/(24*60*60*1000))*1)
if (difference==0)
//change msg here
document.write("Today is Christmas!")
else if (difference>0)
//change msg here
document.write("Only "+difference+" days until Christmas!")
}
//enter the count down date using the format year/month/day
countdown(2012,12,25)
</script>
<a href="bidding.action?item_id=2">click here</a>
</body>
</html>