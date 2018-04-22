# DP_score_mathematical_model
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
* PMX=(APSa_i(unit)⁄MR(unit))*100

**OI – Optimal table index**
Index of row in table T_k, where column RPE intensity indexes inludes APr_i

**RI– Real table index**
Index of row in tableT_k, where PMX is between From and To columns of Percentage of maximum rate

**PS_i** - partial score
**PS_i**=80+((OI(T_k, Apr_i) - RI(T_k, PMX(APSa_i(unit), MR(unit))))*10)

**Heart Rate Score – HRS**
* APc – Activity parts count
* APr_i – Activity Part RPE intensity index
* Ar – Activity RPE intensity index

**Respiratory Rate Score – RRS**
* APc – Activity parts count
* APr_i – Activity Part RPE intensity index
* Ar – Activity RPE intensity index
