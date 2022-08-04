

use challenges;

select `<ticker>`, ROUND(((`<close>`-`<open>`)/(`<open>`))*100,2) as PercentageGain from sample_dataset1 
order by PercentageGain desc limit 5;




