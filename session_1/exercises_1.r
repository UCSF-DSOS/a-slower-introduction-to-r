# 2.3. Suppose that there are three siblings, with heights of 5' 3", 5' 8", and 5'
# 6". Find the average height of the siblings, in inches, by adding the three
# heights and dividing by 3. Try to do this all in one line, without using any
# mental math.
((5*12+3) + (5*12+8) + (5*12+6))/3

# 4.1. A common upper threshold for "optimal" LDL cholesterol is 100 mg/dL. Store
# this value using object assignment, giving the object some arbitrary name,
# like `LDL.cut` or `ldl_optimal_upper`.
LDL.cut<-100

# 2. Retrieve the object at the console, to verify that the object assignment
# worked.
LDL.cut

# 3. Use the object you defined to calculate how much higher a measurement of
# 162 mg/dL is than the optimal threshold.
162-LDL.cut