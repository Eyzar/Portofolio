Score = read.csv("Score.csv", na.strings = c("NA", " "))
ScoreWeight = read.csv("ScoreWeight.csv", na.strings = c("NA", " "))
View(ScoreWeight)

Score = Score[complete.cases(Score), ]
ScoreWeight = ScoreWeight[complete.cases(ScoreWeight), ]

f = function(x, y){
  b = x * y
}

Result = merge(Score, ScoreWeight, by = "Course.Code")
Result

Result$Assignment = Result$Assignment.x * Result$Assignment.y
Result$Mid = Result$Mid.Exam.x * Result$Mid.Exam.y
Result$Final = Result$Final.Exam.x * Result$Final.Exam.y
Result$Total = Assignment + Mid + Final 

Result$Grade = ifelse(Result$Total >= 90, "A", 
                      ifelse(Result$Total >= 85, "B", 
                             ifelse(Result$Total >= 80, "B-", 
                               ifelse(Result$Total >= 70, "C", "D"))))
Result

Hasil.csv = data.frame(Result$Course.Code, Result$Assignment.x , Result$Mid.Exam.x , Result$Final.Exam.x ,Result$Total, Result$Grade)
View(Hasil.csv)

write.csv(Hasil.csv, "C:\\Users/Eyzar/OneDrive/Documents/College/Semester 5/Data Mining/Lab/Sesi 1/Case/Jawaban Case/Results.csv", row.names = FALSE)

read.csv("Results.csv")
