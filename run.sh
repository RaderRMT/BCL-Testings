# declare an array for the scripts
declare -a scriptsArray

# loop through each script and echo it to
# the terminal + add it to the scripts array
i=1
for file in scripts/*.bcl; do
    scriptsArray[$i]=$(pwd)/$file
    echo "[$i] $file"
    i=$((i+1))
done

# get the script index from the user
echo
read -p "> " scriptNumber

# check is the index is a number
regex='^[0-9]+$'
if ! [[ $scriptNumber =~ $regex ]]; then
    echo "Index must be a number!"
    exit 1
fi

# check if the number is in valid bounds
if [ $scriptNumber -lt 1 ] || [ $scriptNumber -gt ${#scriptsArray[@]} ]
then
    echo "Index must be between 1 and ${#scriptsArray[@]}"
    exit 1
fi

# if everything is correct, we run the program
gradle run --args="${scriptsArray[$scriptNumber]}"
