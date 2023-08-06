# RNN-Numerosity-Perception-model

Please run in requential order using MATLAB

# avrg_all.m
execute : S = avrg_all(N,n) to get mean activations for all combinations of inhibition strengths and
set sizes. The function does the task n times and also calculates the average.
output: avrg_data3_a2.2_n30.mat


# get_curve_monotonus.m 
generates the parameters of linear fits only from the largest monotonic regions of the
relation between set-size and mean activation.
Output : C_data_monotonus.mat


# get_back_num_monotonus.m
generates number estimation and estimation-error data for all possible combinations of beta and
set size
Output : relative_error_monotonus_Pre_calc.mat

# Plots:

# Plot_minErrorBeta.m
To find and plot which beta produces minimumum estimation error 
Output : produces MinErrorBeta.eps

# plot_monotonusFit.m
To plot the relationship between mean activation and set size, for various inhibition strengths.
Output : Monotonus.eps

# plot_NumberEstimation.m
To plot number estimation as a function of set size and mean activation.
Output : NumberEstimation.eps
