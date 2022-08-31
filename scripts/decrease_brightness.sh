current_value=$(brightnessctl g)
max_value=$(brightnessctl m)
decrement_amount=$(($max_value/10))
new_value=$((current_value - $decrement_amount))
echo $new_value
command=""
if [ $new_value -gt 5 ]; then
  command="brightnessctl set $new_value"
else
  command="brightnessctl set 5"
fi
eval $command
