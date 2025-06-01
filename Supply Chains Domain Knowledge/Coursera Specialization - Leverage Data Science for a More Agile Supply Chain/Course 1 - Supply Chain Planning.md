# Demand Planning

## Define and Aggregate Relevant Data 

- Demand Planning: historical demand and determine future needs. Demand forecast
- The first step in demand planning is gathering relevant information.
- Stock-Keeping Units (SKUs) 
- The planner will need the historical order quantity information for all the SKUs aggregated to the monthly level
- We can forecast on weekly or even daily basis when dealing with products that are life-saving, require freshness, or have market or business specific constrains
Order history vs. shipment history. Cancellation is a challenge on both logs. 


## Identify Influencing Factors

- Obvious factors on increasing or decreasing demands, like holidays and general events
- Unpredictable factors / patterns may occur during unknown or unusual events, like COVID-19 pandemic. Are we able to predict such events ahead of time??
- Correlation and regression functions in Excel. Python!!

## Influencing Factors

- The video showed how to calculate the correlation between different categories.
- The video showed Regression analysis on Excel for sales value against 3 factors: SQFT, Bathrooms, and district..

I already performed many projects similar using Python and R. We call that in the context of ML Supervised Learning.

## Develop Statistical Demand Forecast

Forecasting using:
- Moving Avg
- Weighted Moving Avg
- Exponential Smoothing 

## Activity

**Prompt**: Compute the simple moving average, weighted moving average, and exponential smoothing forecasts for the data in the Excel file `C1M1-Forecast Activity.xlsx`.

**Response**: I will use Python to fill up the Excel workbook! `Course1-Supply-Chain-Planning.ipynb`

- - -

# Supply Planning

## Identify Demand for Each Product and Capacity

supply planning is the process of confirming the available internal and external capacity for the periods of interest and affirming whether the projected demand (from demand planning) can be met for those periods.

The first step in the supply planning process is to obtain the approved demand plan for each SKU.

## Confirm Internal and External Capacity

One of the crucial activities in the supply planning process is to confirm whether there is enough capacity to produce the quantity required by the demand plan. Supply planners work tirelessly with production planners on factory floors to affirm that the machines’ available capacity and the workforce needed for all the planning horizons can meet the demand plan. **(Demand, Supply, and Production plans)**

Assuming that the product of interest is produced in one of the internal manufacturing facilities, it is usually best to utilize the internal capacity first before going to external supplier.

The planner will need to work with the production planner at each facility to confirm the available **production schedules** for the weeks that cover the **time horizon asked by the demand plan**. This includes ensuring machines have sufficient capacity to produce the desired quantity and that laborers are available to operate machines and pack final products.

Please note that the above production schedule refers to a rough-cut capacity plan, and it is not the final schedule. It is a plan that the production scheduler needs to develop to provide the supply planner with a high degree of accuracy on whether the products can be made according to the demand plan. i.e., **demand plan > supply plan > production plan**

## Confirm Material Availability  

The other crucial activity in the supply planning process is to ensure raw materials and semi-finished components are available to make the required quantity by the timeframe specified in the approved demand plan. Internally, the supply planner may work directly with the material suppliers or go through a materials coordinator to confirm material availability. Supply planning needs to work with external manufacturers' contacts to confirm material availability.

# Constraint Forecast

## Develop a Constraint Forecast

After the demand and supply planning process has had time to perform respective due diligence to develop the approved demand and supply plan, the next step is to develop the constrained forecast. As the name indicates, the constrained forecast is a more realistic demand goal that the company as a whole can achieve. The idea is that demand can only be met when resources and capacity are available. 








# References

- The main content and structure of this markdown file is referred to the **Coursera Specialization: [Leverage Data Science for a More Agile Supply Chain](https://www.coursera.org/specializations/leverage-data-science-agile-supply-chain)**