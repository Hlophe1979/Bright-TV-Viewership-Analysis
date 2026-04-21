# BrightTV Viewership Analytics

## Overview
This project analyzes user behavior and viewership patterns for BrightTV to generate data-driven insights that support subscription growth and improved user engagement. By combining user demographic data with session-level viewing data, the analysis identifies key drivers of consumption and areas of opportunity for the Customer Value Management (CVM) team.

---

## Problem Statement
BrightTV seeks to increase its subscription base and maximize user engagement. However, limited visibility into viewing behavior, content performance, and user preferences restricts the ability to make informed, targeted decisions.

---

## Project Objective
The objective of this project is to:
- Analyze user and usage trends  
- Identify factors influencing content consumption  
- Detect engagement gaps such as drop-off and low-activity periods  
- Provide actionable recommendations to increase viewership and subscriptions  

---

## Data Sources
The analysis is based on two datasets:

1. **User Profiles**
   - UserID, Gender, Race, Age, Province  

2. **Viewership Data**
   - UserID, Channel, Record Date (UTC), Session Duration  

These datasets were joined using a FULL OUTER JOIN on UserID to create a unified analytical dataset. Timestamps were converted from UTC to South African Standard Time for accurate temporal analysis.

---

## Methodology

### Data Preparation
- Cleaned and validated both datasets  
- Standardized column formats  
- Converted timestamps to local time  
- Joined datasets using SQL in Databricks  

### Exploratory Data Analysis
- Analyzed demographic distribution of users  
- Evaluated viewing behavior across:
  - Time of day  
  - Day of week  
- Assessed channel performance using session counts and average duration  
- Measured engagement using session duration and frequency  
- Identified drop-off using short session thresholds (<5 minutes)  

### Analytical Focus Areas
- User segmentation and engagement levels  
- Temporal viewing patterns  
- Content performance and retention  
- Identification of low-consumption periods  

---

## Key Insights

- Viewership is concentrated during afternoon hours, indicating strong prime-time behavior  
- Engagement is significantly higher on weekends compared to weekdays  
- Mid-week periods show consistently lower consumption, highlighting an opportunity for targeted intervention  
- A small segment of users contributes a disproportionate share of total watch time  
- A high proportion of short sessions indicates user drop-off and potential content or discovery issues  
- Some channels attract initial engagement but fail to retain viewers, suggesting weak content performance  

---

## Drivers of Consumption

The following factors were identified as key drivers of user engagement:

- **Time-based behavior:** Peak usage occurs during evenings and weekends  
- **Content performance:** Certain channels consistently outperform others in retention  
- **User demographics:** Engagement varies across age groups, gender, and geographic regions  
- **Content relevance:** Short sessions indicate misalignment between user expectations and content  

---

## Recommendations

### Increase Engagement During Low-Activity Periods
- Introduce targeted content releases during mid-week  
- Promote high-performing content during low-consumption periods  

### Improve Content Discovery and Personalization
- Implement personalized recommendation systems  
- Enhance user interface to surface relevant content more effectively  

### Optimize Content Strategy
- Invest in channels and content types with high retention  
- Review and improve underperforming content  

### Grow the User Base
- Target key demographic segments through digital marketing  
- Leverage social media and referral programs for acquisition  

### Strengthen Retention
- Identify low-engagement users and implement re-engagement strategies  
- Incentivize high-value users to increase loyalty and lifetime value  

---

## Tools and Technologies

- **Project Planning:** Miro, Canva  
- **Data Processing and Analysis:** Databricks (SQL)  
- **Data Visualization:** Microsoft Excel (Pivot Tables and Charts)  
- **Presentation:** Google Slides  

---

## Project Timeline

This project was completed within one week:

- Day 1–2: Data understanding and preparation  
- Day 3: Data integration using SQL  
- Day 4: Exploratory analysis  
- Day 5–6: Visualization and insight development  
- Day 7: Final presentation and reporting  

---

## Conclusion

This analysis demonstrates the value of integrating demographic and behavioral data to better understand user engagement. The insights provide a foundation for targeted strategies to improve content performance, reduce user drop-off, and support sustainable growth in BrightTV’s subscriber base.
