This is a simple, user-friendly bash terminal script for implementing a questionnaire with user taking their input and displaying the scores meanwhile.

To create directory, quiz containing both quiz script and a text file for questions in a unix-based system, 
$mkdir quiz
$cat > quiz.sh
$cat > questions.txt

To append or write to the files
$cat >> quiz.sh
$cat >> questions.txt
and then press ctrl+D or ctrl +Z to escape

To give executable permissions to the shell script
$chmod +x quiz.sh

To run the script
$./quiz.sh

Below is the flow of the events in quiz_shell_script


                  ┌────────────────────────┐
                  │ Start the Script       │
                  └──────────┬─────────────┘
                             │
                             ▼
             ┌────────────────────────────────┐
             │ Initialize variables:          |
             │score=0,qno=0,                  |
             |    file=questions.txt          |
             └────────────────────────────────┘
                             │
                             ▼
           ┌────────────────────────────────────┐
           │ Check if 'questions.txt' exists    │
           └──────────────────┬─────────────────┘
                              │
                ┌─────────────┴─────────────┐
                │                           │
                ▼                           ▼
        ┌─────────────────┐       ┌───────────────────────┐
        │ File exists?    │       │ File missing?         │
        └─────────────────┘       └───────────────────────┘
                │                           │
                │                           ▼
                │                   ┌───────────────────────┐
                │                   │ Print "Error" & Exit  │
                │                   └───────────────────────┘
                ▼
    ┌────────────────────────────┐
    │ Display Welcome Message    │
    └─────────────┬──────────────┘
                  │
                  ▼
       ┌────────────────────────────┐
       │ Loop through each question │
       └─────────────┬──────────────┘
                     │
                     ▼
    ┌────────────────────────────────────────────┐
    │ Display Question & Options                 │
    │ Prompt user: "Enter your answer (a/b/c/d)" │
    └────────────────────────────────────────────┘
                     │
                     ▼
      ┌──────────────────────────────────────────┐
      │ Compare user's input with correct answer │
      └───────────────┬──────────────────────────┘
                      │
          ┌───────────┴───────────┐
          │                       │
          ▼                       ▼
 ┌────────────────────┐   ┌────────────────────────┐
 │ If Correct Answer: │   │ If Wrong Answer:       │
 │ - Print "Correct!" │   │ - Print "Wrong!"       │
 │ - score++          │   │ - Show correct answer  │
 └────────────────────┘   └────────────────────────┘
          │                       │
          └───────────┬───────────┘
                      ▼
        ┌────────────────────────────┐
        │ Display Current Score      │
        │ Pause briefly (sleep 1.5)  │
        └───────────┬────────────────┘
                    │
                    ▼
        ┌───────────────────────────┐
        │ More questions available? │
        └───────────┬───────────────┘
                    │
          ┌─────────┴─────────┐
          │                   │
          ▼                   ▼
 ┌───────────────────┐  ┌────────────────────────┐
 │ Go to next        │  │ End of file reached    │
 │ question          │  └────────────────────────┘
 └───────────────────┘           │
                                 ▼
                ┌────────────────────────────────┐
                │ Display Final Score & Feedback │
                └────────────────────────────────┘
                                 │
                                 ▼
                       ┌────────────────┐
                       │ End of Quiz    │
                       └────────────────┘
