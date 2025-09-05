📌<strong> Overview</strong>

This case study demonstrates how I approached A/B testing to improve agent engagement and lead generation in an online investment platform.
The goal was to analyze whether adding automatic invoice generation and visual analytics would increase agents' activity and the number of new leads introduced.

⚠️ <strong>Important Note</strong>:

The dataset provided here is entirely synthetic and does not contain any confidential, real, or company-related data. It was created solely for portfolio purposes to demonstrate analytical and SQL skills.

# Context

The platform is an <strong>online investment product</strong> with a dedicated <strong>interface for referral agents</strong>. These agents introduce potential investors (leads) and earn commissions based on their leads’ investment activity.
<p>In the original interface, agents could view their leads and the status of each (e.g., registered, invested). If a lead invested, the agent could see the investment amount and investment date — but the <strong>commission calculation was manual</strong>, which led to confusion and drop-off in engagement.

# Problem

Agent interviews revealed two recurring issues:

<li>Difficulty calculating commission fees on their own.</li>
<li>Lack of clarity on overall lead status, conversion, and earnings.</li>
<br>
This ambiguity contributed to <strong>agent inactivity</strong>, i.e., agents stopping after introducing a few leads or not coming back to introduce more.

# Hypothesis

<p style="margin-left:20px;">If we <strong>automate commission calculations</strong> and add <strong>visual reporting of leads performance</strong>, agents will have clearer visibility into their earnings and impact, which will lead to <strong>higher engagement</strong> — measured by a <strong>+20% increase in new, qualified leads introduced per agent</strong>.</p>

# Experiment Design

We tested three interface variants using a randomized rollout:
| Variant | Description | 
|----------|----------|
|Base (Control)   | Original interface with no commission automation or visual data| 
| V1    | Added automatic commission invoice generation, including downloadable PDFs and a table of invoice history (status: paid/unpaid)| 
| V2    | Built on V1, adding interactive visualizations: graphs showing earnings over time, lead conversion funnels, and investment summaries| 

<br>
<strong>Duration</strong>: 4 weeks
<br>
<strong>Sample size</strong>: ~20% of active agents per variant
<br>
<strong>Success metric</strong>: % increase in new leads introduced per agent

# Data sample and SQL queries
<br>
<a href="https://docs.google.com/spreadsheets/d/1abXU5Oc9gYd9ISvtK3EyOxtoDPCswqM4a18p5dSIy0A/edit?usp=sharing">Data Sample</a>
<br>
<br>
I used SQL to understand the following:
<ol type="1">
 <li><strong>Average leads introduced, average session duration, and average engagement rate per Experiment Group</strong></li>
<br>
[Link to SQL queries](https://github.com/OlenaKryvoviaz/Portfolio/blob/main/SQL/AB_test_averages_and_%25_comparing_to_the_base)
  <br>
 <br>
Result
<br>
![Result 1](https://github.com/OlenaKryvoviaz/Portfolio/blob/main/images/Portfolio%20A%3AB%20test%20SQL%201.png)


<li><strong>Correlation between leads introduced and average session durations/leads introduced and average engagement rate</strong></li>
<br>
[Link to SQL queries](https://github.com/OlenaKryvoviaz/Portfolio/blob/main/SQL/AB_test_correlation)
  <br>
Result
<br>
![Result 2](https://github.com/OlenaKryvoviaz/Portfolio/blob/main/images/Portfolio%20A%3AB%20test%20SQL%202.png)

<li><strong>Invoice Download Rates per Group</strong>strong></li>
<br>
[Link to SQL queries](https://github.com/OlenaKryvoviaz/Portfolio/blob/main/SQL/AB_test_downloaded_invoice)
  <br>
Result
<br>
![Result 3](https://github.com/OlenaKryvoviaz/Portfolio/blob/main/images/Portfolio%20A%3AB%20test%20SQL%203.png)


# Results


Variant
% Increase in Leads Introduced
Observations
Base
0% (baseline)
Agents continued manual calculations.
V1
+7%
Invoices were downloaded and viewed, but little behavioral change.
V2
+19%
Clear spike in engagement. Agents explored graphs frequently, indicating improved clarity and motivation.


Supporting Data:
Heatmaps and click data showed agents actively using visual filters and time-range selectors.


Invoice download rates remained high in both V1 and V2 (~80% of active agents).



6. Insights
Automation alone (V1) improved transparency but didn't strongly influence behavior.


Pairing data with visuals (V2) triggered stronger reactivation and ongoing engagement.


Agents who interacted with the graphs were 3× more likely to introduce new leads than those who only used invoice tools.



7. 

8. Next Steps
Roll out V2 to all agents.


Introduce segmentation within the dashboard (e.g., filtering by lead region or campaign).


Plan follow-up experiment on quality of leads: measure not just volume but also lead-to-investor conversion rate.



8. Reflection
This test highlighted the value of data storytelling in product UX. While functionality (automated invoices) was necessary, behavioral motivation came from giving agents intuitive insight into their impact. This reinforced our broader product principle: agents don’t just need data — they need confidence and clarity to act on it.


📢 Disclaimer
This project is for portfolio purposes only.
The dataset is synthetic


No confidential company information is disclosed


The case study illustrates my product management, A/B testing, and analytics skills


