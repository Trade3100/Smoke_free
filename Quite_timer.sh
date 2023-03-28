#!/bin/bash

# Set the cost of one pack of cigarettes
cost_per_pack=25

# Set the number of cigarettes smoked per day
cigarettes_per_day=12

# Calculate the cost of one cigarette
cost_per_cigarette=$(echo "$cost_per_pack/20" | bc -l)

# Set the quit date (YYYY-MM-DD HH:MM:SS format)
quit_date="2023-03-27 23:00:00"

# Calculate the number of seconds since the quit date
seconds_since_quit=$(($(date +%s) - $(date -d "$quit_date" +%s)))

# Calculate the number of cigarettes not smoked
cigarettes_not_smoked=$(($cigarettes_per_day * $seconds_since_quit / 86400))

# Calculate the amount of money saved per hour
money_saved_per_hour=$(echo "$cost_per_cigarette * $cigarettes_per_day / 24" | bc -l)

# Calculate the total amount of money saved
money_saved=$(echo "$money_saved_per_hour * $seconds_since_quit / 3600" | bc -l)

# Display the results
echo "Congratulations! You have been smoke-free for $(($seconds_since_quit/86400)) days, $((($seconds_since_quit%86400)/3600)) hours, and $((($seconds_since_quit%3600)/60)) minutes."
echo "You have not smoked $cigarettes_not_smoked cigarettes."
printf "You have saved %.2f dollars.\n" $money_saved
