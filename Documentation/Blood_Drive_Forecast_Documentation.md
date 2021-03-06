# Blood Drive Forecast Model Documentation
Craig Martyn  
January 23, 2016  

###Introduction
One of the key challenges that a blood bank faces is to accurately forecast how many units of blood will be collected at a given blood drive. This forecast is used to determine the resources allocated to the drive, such as number of staff sent and volume of supplies. If the forecast is too high, these resources (staff time, disposable supplies) may be wasted. If the forecast is too low, donors will have long wait times or not be able to donate.

This model is a very simple tool to help forecast collections for an individual blood drive based on past history and type of account.

###Documentation

####Inputs
The inputs to the model are:

* Number of Units Collected at this Drive in the Past. Enter the number of units of blood collected at the last three occurences of the specific blood drive being forecast. Enter the units collected in chronological order: Drive 1 is the oldest and Drive 3 is the most recent

* Account Type. Select the Account Type from the drop down. The options are Community, Business or School

####Generating the Forecast
To generate the forecast, click the "Update Forecast" button. If you revise any of the inputs and want to update the forecast, click the "Update Forecast" button again.

####Forecast Results
The forecast for the next blood drive is calculated and shown along with a graph of the last three drives (blue bars) and forecast (red bar).

####Forecasting Methodology
The forecast is developed based on a simple trend of the last three blood drives, and adjusted based on the account type.

* Community drives are forecast at 100% of the trend

* Business drives are forecast at 95% of the trend

* School drives are forecast at 105% of the trend
