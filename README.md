# BrightTV Viewership Analytics

## Problem Statement
BrightTV aims to grow its subscription base but lacks clear insight into how users consume content, what drives engagement, and where usage is low.

---

## Aim
Use data to understand user behavior and viewing patterns, and identify opportunities to increase consumption and subscriptions.

---

## Approach

### Data
Two datasets were used:
- **User Profiles:** demographics   
- **Viewership:** session-level data 

These were joined using a **FULL OUTER JOIN on UserID** to create a single dataset combining user attributes with viewing behavior.  

---

### Analysis
The analysis focused on:

- **User trends:** who is watching  
- **Usage trends:** when and how users watch  
- **Channel performance:** what users watch  
- **Drop-off:** short sessions indicating low engagement  

---

## Key Insights

- Viewership peaks in the **afternoon**, showing strong reliance on prime-time viewing  
- **Weekends outperform weekdays**, while mid-week shows the lowest activity  
- A small group of users drives **most of the total watch time**  
- A high number of sessions are **under 5 minutes**, indicating drop-off  
- Some channels attract users but have **low viewing duration**, suggesting weak retention  

---

## Drivers of Consumption

Consumption is mainly influenced by:
- **Time of day** (evenings perform best)  
- **Day of week** (weekends vs mid-week drop)  
- **Content performance** (some channels retain users better)  
- **User segments** (engagement varies across demographics)  

---

## Recommendations

- Release and promote content during **mid-week low periods**  
- Improve **content relevance and discovery** to reduce drop-off  
- Focus on **high-performing channels** and improve weak ones  
- Use **targeted marketing and social media** to grow the user base  
- Re-engage low-activity users and retain high-value users  

---

## Tools Used

- Databricks (SQL) – data preparation and analysis  
- Excel – pivot tables and visualizations  
- Google Slides – presentation  
- Miro, Canva – planning  

---

## Timeline

Completed in 1 week:
- Data preparation and joining  
- Analysis and visualization  
- Insight generation and presentation  

---

## Conclusion

Combining user and session data provided clear insight into when, how, and why users consume content. The findings highlight practical opportunities to improve engagement and support BrightTV’s subscription growth.
