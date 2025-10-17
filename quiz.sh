#!/bin/bash

score=0
qno=0
question_file="questions.txt"

if [ ! -f "$question_file" ]; then
    echo "Error: File not found!" 
    exit 1
fi

total_questions=$(($(grep -cv '^$' "$question_file") - 1))
echo "        Welcome to your terminal quiz session        " 
echo


while IFS='|' read -r question opt1 opt2 opt3 opt4 correct
do
    
    if [[ "$question" == "Question?" || -z "$question" ]]; then
        continue
    fi

    ((qno++))
    echo 
    echo " Question $qno of $total_questions"
    
    echo "$question"
    echo "$opt1"
    echo "$opt2"
    echo "$opt3"
    echo "$opt4"
    echo

    
    read -p "Your answer (a/b/c/d): " answer </dev/tty


    if [[ "${answer,,}" == "${correct,,}" ]]; then
        echo "Correct answer!" 
        ((score++))
    else
        echo "Wrong answer! Correct answer: $correct" 
    fi

    echo "Your current score: $score / $qno"
    echo
    sleep 1.5 
done < "$question_file"

echo
echo " Quiz Completed!"
echo " Final Score: $score / $total_questions"



if [ $score -eq $total_questions ]; then
    echo "Congratulations! Perfect score!" 
elif [ $score -ge $((total_questions  / 2)) ]; then 
    echo "Great efort! Good job!"  
else
    echo "Do well next time!" 
fi
