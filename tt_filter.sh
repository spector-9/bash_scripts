#!/bin/sh
# A basic script to filter all fields containing a string from tsv files especially made for timetables obviouslly
# this script was just for practise as its application are very specific. However anyone is free to use it.
# Run the script with name of the tsv file as an argument. Edit the string variable to change filter.
# Output will be stored in final_cal

cat /dev/null > final_cal

string="" # The string that will be used to search. 

if [ ! -f '2_filtered.txt' ]; then # Makes sure that old temp files don't exist.
    x=2
    while [ $x -lt 10 ] ; do # Create temp files for each hour with name of the day.
        rm $x"_filtered.txt" 2>/dev/null
        cut  -f 1,"$x" "$1" | grep "$string" > $x"_filtered.txt"
        x=$((x + 1))

    done
fi

day=1
while [ $day -lt  7 ]; do

    counter=2
    [ $day -eq 1 ] && day_name="Mon"
    [ $day -eq 2 ] && day_name="Tue"
    [ $day -eq 3 ] && day_name="Wed"
    [ $day -eq 4 ] && day_name="Thu"
    [ $day -eq 5 ] && day_name="Fri"
    [ $day -eq 6 ] && day_name="Sat"
    echo " " >> final_cal

    while [ $counter -lt 10 ]; do # 
        sed -i "$day s/$/$(grep $day_name $counter'_filtered.txt' || printf "\tx")/" final_cal
        sed -i "s/$day_name\t/\t/g" final_cal  # Replace all days and tabs with plain tabs
        counter=$((counter + 1))
        
    done

    echo $day
    sed -i "$day s/^/$day_name/" final_cal # Add day name at the beginning of the current line
    day=$((day + 1))

done

sed -i '1s/^/	09:00:00	10:00:00	11:00:00	12:00:00	13:00:00	14:00:00	15:00:00	16:00:00 \n/' final_cal
echo "Cleaning temp. files"

x=2
while [ $x -lt 10 ] ; do
    rm $x"_filtered.txt"
    x=$((x + 1))
done

echo "Done"
