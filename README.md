# Cortisol-Concentration-modeling
In this project we use deconvolution method to estimate cortisol concentration state from our observation and its control.


The reference of our solution is the paper “Deconvolution of Serum Cortisol Levels by Using Compressed Sensing” written by Dr. Rose Faghih in 2014. We explain our step by step approach to deconvolve the cortisol concentration of blood (sampled from serum) based on the u(t) signal which is an abstraction of the hormone pulses that result in cortisol secretion. Based on this problem we want to optimize values of and which based on the paper represent the θ1,θ2 infusion rate of cortisol from the adrenal glands into the blood and the clearance rate of cortisol by the liver.
