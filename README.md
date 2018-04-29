# Mathematical Model for Calculation of sporty score
#### This Repisitory serves as open source demonstration of my own mathematical model for calculation of estimation of effort or actual form of various sportsmans at the level of single sporting activity based on global RPE and received data from sensor devices measuring heart rate and respiratory rate. This model is excluded from my Master’s Thesis: Data processing from sensor systems in the field of sports. Model can be freely used in future studies in the field of evaluating athletic form.

## Mathematic model description
* HRS - Heart Rate Score
* RRS - Respiratory Rate Score

![Alt text](math_model_1.png?raw=true "Title")

**Sporty form score for Athlete in Activity**

S = ((HRS + RRS)) ⁄ 2

## Variables description
**RPE – Heart Rate table -T_1**

RPE intensity indexes | From - Percentage of maximum heart rate | To - Percentage of maximum heart rate
 ------------ | ------------- | -------------
None	 | 0%	 | 20%
None | 	20% | 	30%
1 | 	30%	 | 50%
2, 3 | 	50% | 	60%
4	 | 60% | 	70%
5, 6 | 	70%	 | 80%
7, 8 | 	80%	 | 90%
9, 10	 | 90% | 	∞

**RPE – Respiratory Rate table -T_2**

RPE intensity indexes | From - Percentage of maximum heart rate | To - Percentage of maximum heart rate
 ------------ | ------------- | -------------
None	 | 0%	 | 20%
None | 	20% | 	30%
1 | 	30%	 | 50%
2, 3 | 	50% | 	60%
4	 | 60% | 	70%
5, 6 | 	70%	 | 80%
7, 8 | 	80%	 | 90%
9, 10	 | 90% | 	∞

**PMX – Percentage to max Sensor unit rate**
* APSa_i(unit) - Average Sensor unit value in Activity Part
* MR(unit) - Maximum rate for Sensor unit
* PMX = (APSa_i(unit) ⁄ MR(unit)) * 100

**OI – Optimal table index**

Index of row in table T_k, where column RPE intensity indexes inludes APr_i

**RI– Real table index**

Index of row in tableT_k, where PMX is between From and To columns of Percentage of maximum rate

**PS_i** - partial score

**PS_i**=80+((OI(T_k, Apri_i) - RI(T_k, PMX(APSa_i(unit), MR(unit))))*10)

**Heart Rate Score – HRS, using heart rate sensor data**
* APc – Activity parts count
* APr_i – Activity Part RPE intensity
* APri_i – Activity Part RPE intensity index
* Ar – Activity RPE intensity index

**Respiratory Rate Score – RRS, using respiratory rate sensor data**
* APc – Activity parts count
* APr_i – Activity Part RPE intensity
* APri_i – Activity Part RPE intensity index
* Ar – Activity RPE intensity index

## Example of calculation
**Initial values**

for 2 parts of activities,Ar=〖APr〗_0+〖APr〗_1=90
  * 20 minutes of stretching with RPE intensity index 2, 〖APr〗_0=2*20=40
    * with HR PMX = 55%
    * with RR PMX = 62%
  * 10 minutes of running with RPE intensity index 5, 〖APr〗_1=5*10=50
    * with HR PMX = 88%
    * with RR PMX = 91%

**Formula usage example**
* HRS = ((80 + (OI(T_1, APri_0) - RI(T_1, PMX(APSa_0("heart_rate"), MR("heart_rate")))) * 10) * (APr_0 / Ar)) + ((80+(OI(T_1, APri_1) - RI(T_1, PMX(APSa_1("heart_rate" ), MR("heart_rate")))) * 10) * (APr_1 / Ar))
* RRS = ((80 + (OI(T_2, APri_0) - RI(T_2, PMX(APSa_0("respiratory_rate"), MR("heart_rate")))) * 10) * (APr_0 / Ar)) + ((80 + (OI(T_2, APri_1) - RI(T_2, PMX(APSa_1("respiratory_rate"), MR("heart_rate")))) * 10) * (APr_1 / Ar))
* S=((HRS + RRS)) ⁄ 2

**Real usage example**
* HRS = ((80 + (3-3) * 10) * (40 / 90)) + ((80 + (5-6) * 10) * (50 / 90)) = 74,44points
* RRS = ((80 + (3-4) * 10) * (40 / 90)) + ((80 + (5-7) * 10) * (50 / 90)) = 64,44points
* **S = ((74.44 + 64.44)) ⁄ 2 = 69.44points**
