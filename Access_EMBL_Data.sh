SubmissionID="Hx2000055701"

source /home/ben/anaconda2/bin/activate minionvironment

cd src

python search_embl_submissions.py \
 --submissionid=$SubmissionID

source /home/ben/anaconda2/bin/deactivate
