![Screenshot 2024-12-23 150337](https://github.com/user-attachments/assets/c50c0050-feae-4c8a-b18f-80da570621a3)
This repository features an in-depth analysis of Indian restaurants data, leveraging SQL queries and visualization techniques to derive meaningful insights. The analysis focuses on ratings, cost metrics, cuisine types, and vote distributions. Results are designed for Power BI visualization to build an interactive dashboard, enabling strategic decisions for restaurant management and customer engagement.

# Dataset Description

The dataset consists of 6,590 entries with the following attributes:

- **Name:** The name of the restaurant.
- **Location:** Specific address or landmark.
- **Locality:** Neighborhood or area.
- **City:** City where the restaurant is located.
- **Cuisine:** Types of cuisine offered.
- **Rating:** Average customer rating (out of 5).
- **Votes:** Number of customer reviews.
- **Cost:** Approximate cost for two people (in INR).

# Insights from the Dashboard

## Key Metrics
- **Total Restaurants:** 4,503
- **Total Cities Covered:** 23
- **Total Cuisines:** 2,096
- **Total Cost Volume:** 7M INR

## Geographic Distribution
- **Bangalore leads** with 26.92% of total restaurants.
- **Top 5 cities by restaurant count:**
  1. **Bangalore** (1,017)
  2. **Delhi** (734)
  3. **Mumbai** (727)
  4. **Kolkata** (711)
  5. **Hyderabad** (589)

## Rating Demographics
- **Overall Average Rating:** 4.09/5
- **Top Rated Cities:**
  1. **Gurgaon** (4.32)
  2. **Agra** (4.25)
  3. **Ahmedabad** (4.21)

## Cost Brackets Analysis
- **Below 500 INR**
- **500-1000 INR**
- **1000-1500 INR**
- **1500-2000 INR**
- **Above 2000 INR**

## Customer Engagement
- **Average Votes per Restaurant:** 119.47
- **Highest Vote Concentration:** Metropolitan cities
- **City with Most Votes:** Bangalore

# Questions Analyzed

1. **Top Cities Analysis:**
   - Identify the top 5 cities with the most restaurants.
   - Calculate the average ratings for these cities.

2. **Cuisine Popularity:**
   - Determine the most frequently offered cuisines across restaurants.

3. **Cost Analysis:**
   - Analyze the average dining cost for each city.
   - Highlight cities with the highest and lowest dining costs.

4. **Rating Insights:**
   - Examine the distribution of restaurant ratings.
   - Identify highly-rated restaurants (ratings ≥ 4.5).

5. **Customer Engagement:**
   - Find restaurants with the highest number of votes.
   - Investigate correlations between ratings, votes, and cost.

# Summary of Findings

- **City Insights:** Major cities like Delhi, Mumbai, and Bangalore host the highest number of restaurants, with average ratings between 4.0 and 4.3.
- **Cuisine Trends:** North Indian cuisine is the most popular, followed by Continental and Chinese options.
- **Cost Analysis:** Mumbai has the highest average dining cost, while smaller cities are more affordable.
- **Top Performers:** Restaurants with over 5,000 votes generally have excellent ratings.
- **Customer Preferences:** Ratings correlate positively with votes but show limited correlation with cost, indicating quality and popularity outweigh expense for customers.

# Limitations and Future Recommendations

### Current Limitations
1. **Data Timeframe:**
   - Lack of temporal data for seasonal analysis
   - No timestamp information for peak hours/days

2. **Data Coverage:**
   - Limited to restaurant-level metrics
   - Missing customer demographic information
   - Absence of delivery-specific metrics

3. **Geographical Constraints:**
   - Uneven distribution across tier-2/3 cities
   - Limited data from suburban areas
   - Missing exact coordinates for spatial analysis

### Future Recommendations

1. **Data Collection:**
   - Implement timestamped data collection
   - Include customer demographics
   - Add delivery metrics and order patterns
   - Collect menu-level pricing data

2. **Analysis Enhancement:**
   - Develop predictive models for demand
   - Create cuisine-specific price elasticity studies
   - Implement real-time rating analysis
   - Add competitor analysis framework

3. **Technical Infrastructure:**
   - Integrate automated data validation
   - Implement real-time dashboard updates
   - Add geospatial analysis capabilities
   - Develop API for direct data access

# Conclusion

This analysis reveals crucial patterns in India's restaurant ecosystem through 4,503 establishments across 23 cities. Key findings show:
- Metropolitan dominance in restaurant density
- Price sensitivity varying by region
- Strong correlation between engagement and metropolitan presence
- Cuisine diversity impacting ratings

The insights enable:
- Strategic restaurant placement
- Dynamic pricing optimization
- Enhanced customer targeting
- Data-driven expansion planning

**Explore the interactive Power BI dashboard for a deeper dive into the data and insights!**

#RestaurantAnalytics #DataScience #SQLAnalysis #PowerBI #FoodTech #BusinessIntelligence #DataVisualization #IndianRestaurants
![Overview](https://github.com/user-attachments/assets/3eb04fca-d71a-4371-bc18-1cf82255c99c)


