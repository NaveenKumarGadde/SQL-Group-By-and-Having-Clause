use youtube_statistics;

SELECT * FROM youtube_statistics.`youtube statistics`;


-- Total Highest yearly earnings for the youtubers by country 

SELECT 
     sum(highest_yearly_earnings) as Total_earnings,
     Country
FROM youtube_statistics.`youtube statistics`
GROUP BY Country
ORDER BY Total_earnings desc;

-- Total Highest yearly earnings for the youtubers by country and also count of no of youtubers

SELECT 
     sum(highest_yearly_earnings) as Total_earnings,
     Country,
     count(Youtuber) as no_of_youtubers
FROM youtube_statistics.`youtube statistics`
GROUP BY Country
ORDER BY Total_earnings desc;


-- Total Views for the Youtubers by Channel Type

SELECT 
     sum(`video views`) as Total_views,
     channel_type
FROM youtube_statistics.`youtube statistics`
GROUP BY  channel_type
ORDER BY Total_views desc;



-- Total Yearly Earnings By Continent 

With total_earnings as (
Select	
     CASE
     WHEN Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
          "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
          "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
          "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
          "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
          "South Sudan","Sudan","Tanzania""Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'

     WHEN Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
          "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
          "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
          "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
          "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
         "Ukraine","United Kingdom","Vatican City") then 'Europe'

     WHEN Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
        "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
        "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
        "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
        "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'

     WHEN Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
         "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
        "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'

     WHEN Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
         "Uruguay","Venezuela") then 'South_America'

     WHEN Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
         "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania '
	END as continents,
    Country,
    highest_yearly_earnings
FROM youtube_statistics.`youtube statistics`) 

SELECT continents,
       sum(highest_yearly_earnings) as Total_earnings
FROM total_earnings
GROUP BY continents;


-- Total No of Subscribers by Country 

SELECT Country,
       sum(subscribers) as Total_subscribers
FROM youtube_statistics.`youtube statistics`
GROUP BY Country
ORDER BY 2 desc;


-- Total No of Subscribers by Channel Type

SELECT channel_type,
       sum(subscribers) as Total_subscribers
FROM youtube_statistics.`youtube statistics`
GROUP BY channel_type
ORDER BY 2 desc;


-- Having Clause 


-- Total Highest yearly earnings for the youtubers by country having earnings more than 100000000

SELECT 
     sum(highest_yearly_earnings) as Total_earnings,
     Country
FROM youtube_statistics.`youtube statistics`
GROUP BY Country
HAVING Total_earnings >= 100000000
ORDER BY Total_earnings desc ; 



-- Total Views for the Youtubers by Channel Type  where  views are above 100000000 

SELECT 
     sum(`video views`) as Total_views,
     channel_type
FROM youtube_statistics.`youtube statistics`
GROUP BY  channel_type
HAVING Total_views >= 100000000
ORDER BY Total_views desc;


-- Total Views for the Youtubers by Channel Type  where  views are above 100000000 and country i India

SELECT 
	Country,
     sum(`video views`) as Total_views,
     channel_type
FROM youtube_statistics.`youtube statistics`
WHERE Country in ('India')
GROUP BY  channel_type
HAVING Total_views >= 100000000
ORDER BY Total_views desc;



-- Total No of Subscribers by Country and having subscribers more than 100000000

SELECT Country,
       sum(subscribers) as Total_subscribers
FROM youtube_statistics.`youtube statistics`
GROUP BY Country
HAVING Total_subscribers >= 100000000
ORDER BY 2 desc; 



-- Total No of Subscribers by Channel Type and subscriers greater than 500000000

SELECT channel_type,
       sum(subscribers) as Total_subscribers
FROM youtube_statistics.`youtube statistics`
GROUP BY channel_type
HAVING Total_subscribers >= 500000000
ORDER BY 2 desc;


-- Total No of Subscribers by Channel Type and subscriers greater than 500000000 and where country is India 

SELECT channel_type,
       Country,
       sum(subscribers) as Total_subscribers
FROM youtube_statistics.`youtube statistics`
WHERE Country = 'India'
GROUP BY channel_type
HAVING Total_subscribers >= 500000000
ORDER BY 2 desc;










 