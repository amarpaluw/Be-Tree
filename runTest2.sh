make clean && clear && reset && make
rm -rf temp_store && mkdir temp_store

# number_of_operations 7 - 11
for x in {7..11}
do
numops=$((2**$x))

for (( y=1; y<=$(($x-2)); y++ ))
do
keys=$((2**$y))

./test -d temp_store -m benchmark-inserts -k $keys -t $numops
./test -d temp_store -m benchmark-deletes -k $keys -t $numops
./test -d temp_store -m benchmark-updates -k $keys -t $numops

done
done
