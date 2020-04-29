## Codes and sample files for replicating the results in Chapter 3 of Jermy Thomas' MS Thesis

To recreate this study:

### 1. Gather data from individual sources:

  a. Sensors as mentioned in Chapter 3: These sensors should be connected to Arduino UNOs, and the codes for running these are in the Codes/ArduinoCodes. Run these from a computer that is connected to the Arduino which is connected to the Atmos and SHT 21 sensor to start gathering information. The sample files that are generated are shown in SampleFiles/Inputs/RawSensorData.

  b. Survey Data: This data is the responses from surveys that were digitized manually into CSV files. The sample files are located at SampleFiles/Inputs/RawSurveyData. 

  c. Heart Rate Data: This is information that was gathered from Fitbit Charge 3. The per-minute data was downloaded as CSV files from https://www.squashleagues.org/Fitbit/FitbitDataDownload. The sample files are located at SampleFiles/Inputs/RawHRData. 

  d. Black Globe Temperatures: This data was downloaded from the CR1000 datalogger. The sample files are located at SampleFiles/Inputs/RawBGData. 

### 2. Initial Processing: 

Run the individual raw data files through the following codes in Codes/RawDataProcessingCodes:

  a. Atmos_sensor_data (10.csv/50.csv/110.csv) -> Atmos_cleaner.py
  b. Other_sensor_data -> sensor_cleaner.py
  c. Survey_data -> participant_response_cleaner.py
  d. HR_data -> HR_cleaner.py
  e. BG_data -> BG_cleaner.py
  
Once the initial processing is done, the next step is combining the files.

### 3. Combine all

  Point these individual files in the Codes/RawDataProcessingCodes/combine_all.py and run it!

### 4. Give the attributes: 

  The important attributes are added to the csv. This is done by editing the attributer.py file in Codes/RawDataProcessingCodes/ manually to add attributes like gender for each participant. The final output should look like /SampleFiles/Inputs/ProcessedOutput/All_Sample.csv.

### 5. Run the final processing files:

To create the linear relationship heatmaps, run the 'All.csv' file through https://github.com/SSESLab/JermyR/blob/master/corr_plots.R. 

To create the non-linear relationship bar charts, run 'All.csv' through https://github.com/SSESLab/JermyPython/blob/master/Codes/FinalProcessingCodes/Chapter_3.ipynb.
  
