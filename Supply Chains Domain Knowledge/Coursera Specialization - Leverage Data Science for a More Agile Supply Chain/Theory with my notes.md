# Course 1: Supply Chain Planning


## Demand Planning

### Define and Aggregate Relevant Data 

- Demand Planning: historical demand and determine future needs. Demand forecast
- The first step in demand planning is gathering relevant information.
- Stock-Keeping Units (SKUs) 
- The planner will need the historical order quantity information for all the SKUs aggregated to the monthly level
- We can forecast on weekly or even daily basis when dealing with products that are life-saving, require freshness, or have market or business specific constrains
Order history vs. shipment history. Cancellation is a challenge on both logs. 


### Identify Influencing Factors

- Obvious factors on increasing or decreasing demands, like holidays and general events
- Unpredictable factors / patterns may occur during unknown or unusual events, like COVID-19 pandemic. Are we able to predict such events ahead of time??
- Correlation and regression functions in Excel. Python!!

### Influencing Factors

- The video showed how to calculate the correlation between different categories.
- The video showed Regression analysis on Excel for sales value against 3 factors: SQFT, Bathrooms, and district..

I already performed many projects similar using Python and R. We call that in the context of ML Supervised Learning.

### Develop Statistical Demand Forecast

Forecasting using:
- Moving Avg
- Weighted Moving Avg
- Exponential Smoothing 

### Activity

**Prompt**: Compute the simple moving average, weighted moving average, and exponential smoothing forecasts for the data in the Excel file `C1M1-Forecast Activity.xlsx`.

**Response**: I will use Python to fill up the Excel workbook! `Course1-Supply-Chain-Planning.ipynb`

- - -

## Supply Planning

### Identify Demand for Each Product and Capacity

supply planning is the process of confirming the available internal and external capacity for the periods of interest and affirming whether the projected demand (from demand planning) can be met for those periods.

The first step in the supply planning process is to obtain the approved demand plan for each SKU.

### Confirm Internal and External Capacity

One of the crucial activities in the supply planning process is to confirm whether there is enough capacity to produce the quantity required by the demand plan. Supply planners work tirelessly with production planners on factory floors to affirm that the machines’ available capacity and the workforce needed for all the planning horizons can meet the demand plan. **(Demand, Supply, and Production plans)**

Assuming that the product of interest is produced in one of the internal manufacturing facilities, it is usually best to utilize the internal capacity first before going to external supplier.

The planner will need to work with the production planner at each facility to confirm the available **production schedules** for the weeks that cover the **time horizon asked by the demand plan**. This includes ensuring machines have sufficient capacity to produce the desired quantity and that laborers are available to operate machines and pack final products.

Please note that the above production schedule refers to a rough-cut capacity plan, and it is not the final schedule. It is a plan that the production scheduler needs to develop to provide the supply planner with a high degree of accuracy on whether the products can be made according to the demand plan. i.e., **demand plan > supply plan > production plan**

### Confirm Material Availability  

The other crucial activity in the supply planning process is to ensure raw materials and semi-finished components are available to make the required quantity by the timeframe specified in the approved demand plan. Internally, the supply planner may work directly with the material suppliers or go through a materials coordinator to confirm material availability. Supply planning needs to work with external manufacturers' contacts to confirm material availability.

## Constraint Forecast

### Develop a Constraint Forecast

After the demand and supply planning process has had time to perform respective due diligence to develop the approved demand and supply plan, the next step is to develop the constrained forecast. As the name indicates, the constrained forecast is a more realistic demand goal that the company as a whole can achieve. The idea is that demand can only be met when resources and capacity are available. 

### Conduct a Consensus Meeting

The main goal of the consensus meeting is to discuss and mitigate the surplus and shortfalls in demand and supply. Each month, after demand and supply planners have approved their plans, they are reviewed and discussed by company leaders.

## Measure Results

### Collect Actual Performance Results

Before measuring performance results, it’s essential to realize that no forecast or plan is perfect, and there is always room for improvement. Results should **not** be used to **penalize anyone (unless there are repeated errors)**. Instead, the main goal of these results is to **drive improvements for the entire planning process**. 

The first step in measuring results is to ensure **metrics or key performance indicators (KPIs) have been identified**. It is good to have no more than 5 to 7 metrics that can help indicate the health of forecast performance, inventory velocity, and order fulfillment. Some standard metrics are **forecast accuracy, inventory turns, and on-time in-full (OTIF)**.  

Once metrics are in place, **data** can then be gathered accordingly. Metrics are typically measured monthly, so historical data needs to be aggregated to the monthly level. These metrics can also be calculated weekly, though they are less common and usually due to specific business requirements.

Notes:
- Here comes the role of having solid data pipeline (data engineer), where the final result must be a neat dashboard (data analyst). Room for RnD comes with developing statistical models to applied in MLOPs (data scientist-ML Eng.). Maybe, we can build integration between Python, ERP system, and a dashboard (PowerBI or `dash` library), so once a new input comes, a predicted value (predicted time) might be the result; there is high potential to develop many ideas (integrating automation) that involve presenting a future dashboard to stakeholders. 



- - 

# Course 2: Inventory Management

## Steady-State Demand: No Demand Variability

### Demand Behavior

**Variability**, by definition, is the lack of a consistent or fixed pattern. For supply chains, variability in demand means **inconsistency** in how customers purchase goods. For example, suppose a customer purchases a particular brand of soap with the same attributes (color, shape, scent, etc.) once a month. In this case, their demand behavior is **consistent** and does not contribute any variability to the system;**we call this scenario steady-state demand**. But if a customer purchases two medium-sized lavender scented soaps this month, ten lemon-scented the next, and then makes no purchases for the following three months, this customer **is contributing variability to the system**. In other words, we say **this scenario has demand variability**.

### Lead Time

Some typical lead times are: Manufacturing lead time, freight lead time (ocean or air), custom and processing lead time at the ports, last-mile delivery lead time. 

Note: I think that `lead time` would be a dependent variable where we can use data to predict it. We need to define it properly, so once independent variables, (for example mentioned lead times above but not limited), are defined we can gather data, then predict estimators, and find out the final statistical representation. I think `lead time` value determines **WHEN** we should place any order. However, the **amount** value also wanted by stakeholders, where I think we can analyze demand and supply data, predict initial values, then we can develop statistical model for EACH finished good product separately. 

Note: The instructor of the course showed an equation on how to calculate the reorder point.. With reference to my note above, you may start RnD project, you will need first to search for existed theories especially about cases where demand behavior is not consistent (variable). However, I believe ML would solve it. Second, it depends on the real-case data from the proposed supply chain company.

- Check the practical notebook for the activity.


## Inventory Management with Demand Variability

### Sources of Variability

- The steady-state case often does not exist in the rea world.

-  In the real world, we often encounter variabilities, and some common ones are:

    1. Transportation disruption due to weather or political events
    2. Shortage of materials or components due to labor disputes
    3. Unexpected increase in demand due to factors not previously considered

### Ways to Counter Variability

there are several ways to mitigate the effects of variability on the supply chain, which include the following:

1. Increase available information
2. Shorten lead times
3. Hold optimal safety stock


- Check the practical notebook for the activity part


- - 


# References

- The main content and structure of this markdown file is referred to the **Coursera Specialization: [Leverage Data Science for a More Agile Supply Chain](https://www.coursera.org/specializations/leverage-data-science-agile-supply-chain)**

