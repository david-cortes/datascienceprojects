# Data Science examples

This is a collection of interesting examples and projects in machine learning, business intelligence and optimization that I’ve done as part of coursework, homeworks, books, online courses, personal projects and others. Most of them use public or simulated data.

They are all built in either R (presented as an R Markdown document or Shiny application, along with the script that builds it) or Python + Spark (presented as an IPython notebook), including the code that does the analysis, results, explanations and technical comments. Please note that they are not updated and some of the software packages have incorporated new functionality and different commands since the time some of these were produced. Most of the links below point towards links generated from nbviewer and htmlpreview – opening the files within GitHub itself might cause some bad behavior (e.g. mathematical symbols not appearing, TOC not clickable).

## Machine Learning
* **Clustering musical artists (Python + Spark) [(click here)](http://nbviewer.ipython.org/github/david-cortes/datascienceprojects/blob/master/machine_learning/clustering_fm_artists.ipynb):** clustering (finding similar groups of) musical artists using the data from Last.fm on top-played artists per user (large dataset) with graph-based methods, using Spark to parallelize the computations and speed-up the process.
* **Recommending movies based on user and movie info (Python) [(click here)](http://nbviewer.ipython.org/github/david-cortes/datascienceprojects/blob/master/machine_learning/recommender_system_w_coldstart.ipynb):** building a recommender system according to how users with different characteristics rate certain movies of certain genres better or worse than average. Unlike collaborative filtering, this has the advantage of being able to produce personalized recommendations to new users without ratings.
* **Recommending movies based on past user ratings (Python + Spark) [(click here)](https://github.com/david-cortes/datascienceprojects/blob/master/machine_learning/recommender_system.ipynb):** building a very basic, distributed recommender system using collaborative filtering on the movie ratings dataset from movielens, based on low-rank matrix factorization.
* **Diversifying recommendation lists (Python) [(click here)](http://nbviewer.ipython.org/github/david-cortes/datascienceprojects/blob/master/machine_learning/topic_diversification.ipynb):** selecting diverse top-N recommended items from a larger list. As recommendation formulas tend to be based on predicted ranking/probability, they tend to contain elements that are too similar to each other (e.g. all books form the same author), and some diversification can help make them better even if their final predicted scores are lower.
* **Entity Resolution (R) [(click here)](http://htmlpreview.github.io/?https://github.com/david-cortes/datascienceprojects/blob/master/machine_learning/entity_resolution.html) [(computations in Spark)](https://github.com/david-cortes/datascienceprojects/blob/master/machine_learning/heavy_computations.ipynb):** (also called record linkage) determining (with probabilistic models) which product descriptions indexed by Google from different sites refer to the same product listed at Amazon based on their description.
* **Topic Modeling (R’s Shiny) [(click here)](https://david-cortes.shinyapps.io/textmining):** [topic modeling](https://en.wikipedia.org/wiki/Topic_model) on the latest tweets from popular data science sites – in other words, finding out what are they talking about, by means of computer algorithms.


## Optimization
* **List ranking (Python) [(click here)](http://nbviewer.ipython.org/github/david-cortes/datascienceprojects/blob/master/optimization/list_optimization.ipynb):** looking for the optimal order in which to rank the items in a list, according to incomplete series of aggregated preferences between two items (ItemA > ItemB) from different people. The number of possible orderings makes a brute-force search impossible, but it can be efficiently solved with local search methods and greedy algorithms (e.g. Kwik-Sort).
* **Non-linear optimization examples (Python) [(click here)](http://nbviewer.ipython.org/github/david-cortes/datascienceprojects/blob/master/optimization/nonlinearopt.ipynb):** small tutorial illustrating how to solve a toy constrained non-linear optimization problem (minimizing a function subject to constraints)(hs071) in different solver interfaces for Python (scipy, casadi, nlopt, cvxopt, pyipopt), and a short benchmark when solving a larger problem (hs103).
* **Splitting biased dataset from convenience-sampling (Python) [(click here)](http://nbviewer.ipython.org/github/david-cortes/datascienceprojects/blob/master/optimization/dataset_splitting.ipynb):** Splitting a dataset of feedback from users about products into a training and test set (for a recommendation algorithm) in such a way that the sets would contain non-intersecting subsets of users and products, while meeting some criteria such as minimum size and minimum number of products from each category – this step on itself represents a whole optimization problem.


## Business Intelligence
* **RFM Analysis (R) [(click here)](http://htmlpreview.github.io/?https://github.com/david-cortes/datascienceprojects/blob/master/business_intelligence/rfm.html):** using transaction data from an online application (software) to calculate the lifetime value of customers, see which customers are at risk of defecting and finding segments (groups of similar users) from the users that are still active, based on probabilistic models using RFM analysis (Recency-Frequency-Monetary). One of the difficulties with such data is that payments are not made on a regular basis and it’s hard to determine who is still an active user.
* **Database Marketing (R) [(click here)](http://htmlpreview.github.io/?https://github.com/david-cortes/datascienceprojects/blob/master/business_intelligence/database_marketing.html):** using survival analysis (also called duration modeling) to model customer retention and attrition over time in a phone company, according to the channel through which they were acquired and the market to which they belong, then building a model for estimating expected customer revenue after 1 year and after 3 years according to how customers were obtained.
* **Marketing Research (R) [(click here)](http://htmlpreview.github.io/?https://github.com/david-cortes/datascienceprojects/blob/master/business_intelligence/perceptual_map.html):** creating a perceptual map (also called “brand map”) of laptop brands from a small survey using principal components biplots and comparing it to other types of brand maps with data from surveys on university courses and perception of countries.


#### Contact info: david.cortes.rivera@gmail.com
