# Project Opus
My work repository for a smarter news-monitoring

## About the project
Project Opus was born from a frustation with existing Danish news monitoring solutions. Tired of expensive and inefficient solutions such as Infomedia or Retriever, Project Opus aims at combining quick and near-real time news monitoring with intelligent classification and natural language tools, to give its user a brief and useful overview of

1. What are the most prevalent / important topics covered in relevant national media right now
2. How and to what extent are relevant stakeholders contributing to this discussion
3. How does the public discussion - as reflected in relevant media - change over time

This repository will be updated as modules are constructed. I'll try to document the work in this README. Currently, the tentative work plan will be:

1. Proof of concept
   1. Create a realiable and efficient web-scraper to pull news (text) articles from relevant news media (i.e. www.dr.dk)
   2. Create and maintain an updated database of older news for the last X months
   3. Define method for identifying and reporting relevant topics, using Structural Topic Modelling
  
2. Service-basics
   1. Create a web-client for users to set up their own search-parameters
   2. Create a daily report with relevant news - the most relevant on topics
   3. Add summary statistics per day
  
3. Refine 
   1. Build website
   2. Add user features, i.e. login, dashboard, charts
   3. Add sentiment analysis
   
3. Expand
   1. Move to cloud
   2. Include more media
	