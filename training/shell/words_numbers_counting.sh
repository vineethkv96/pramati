echo Enter the filename
read filename

#data=`cat $filename`
data=`sed -e "s/[^[:alnum:]]/ /g" $filename`

numberCount=0;
oddWordCount=0;
evenWordCount=0;

for token in $data;
do
        re='^[0-9]+$';
        if [[ $token =~ $re ]]
        then
                numberCount=$((numberCount+1));
        else
                count="${#token}";
                rem=$(( $count % 2 ))
                if [ $rem -eq 0 ]
                then
                        evenWordCount=$((evenWordCount+1));
                else
                        oddWordCount=$((oddWordCount+1));

                fi;
        fi;
done;

echo "odd word count: $oddWordCount";
echo "even word count: $evenWordCount";
echo "number count: $numberCount";

