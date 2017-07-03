# This seems to be working.
projectFileName="project.xml"
projectSubmissionFileName="projectsub.xml"
#testEnaSite="https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/"
testEnaSite="https://www-test.ebi.ac.uk/ena/submit/drop-box/submit/"
#userName="Webin-31983"
userName="c.voorter@mumc.nl"
password="veerchris"

submissionFileName="EMBL.HLA.Submission2.txt"
zippedFileName=$submissionFileName".gz"
md5FileName=$zippedFileName".md5"

ftpHost="webin.ebi.ac.uk"


# Determine a working directory. Folder underneath executable called temp.
# Give my submission a filename. SOmething with a datetime stamp



# Write submission to a file



# gzip the submission file.  Make a gz file.
gzip -k $submissionFileName
        
# Calculate an MD5SUM
md5sum $zippedFileName > $md5FileName
        
# Use FTP (HAH!) to send the file to EMBL
# Acutally this is really clever, 
# << EOT will pipe all the text afterwards, until EOT. 
# This feeds text to the ftp commands.
ftp -n -v $ftpHost << EOT
ascii
user $userName $password
pass
prompt
mput $zippedFileName
mput $md5FileName
ls -al
bye
EOT

# Create a Project in the Test Environment
#curl -k -F "SUBMISSION=@"$projectSubmissionFileName -F "PROJECT=@"$projectFileName $testEnaSite"?auth=ENA%20"$userName"%20"$password > curlProjResults.xml
#curl -k -F "SUBMISSION=@projectsub.xml" -F "PROJECT=@project.xml" "https://www-test.ebi.ac.uk/ena/submit/drop-box/submit/?auth=ENA%20c.voorter@mumc.nl%20veerchris"



   
                



        # Curse at the pointless restrictions on FTP at the hospital.
        
        # If new Project is selected
            # Generate Project XML Files
            # Create a new project REST
            # Open Response, determine if success
            
            # If errors:
                # report Errors and give up
            # else:
                # store accession#
        
        # else (existing project)
            # Store the project accession #
        
        # Generate XML Files for new sequence
        # REST the new XML files over to them.
        # Open response determine if success?
        # Gather Important Accession Numbers
        # Store accession number in our config file
        # Popup message with Results











#Create a submission on that project
projectAccessionNum="PRJEB21595"
analysisSubmissionFileName="sequencesub.xml"
analysisFileName="analysis.xml"
#curl -k -F "SUBMISSION=@"$analysisSubmissionFileName -F "ANALYSIS=@"$analysisFileName $testEnaSite"?auth=ENA%20"$userName"%20"$password > curlSeqResults.xml






























#Old stuff:




#SubmissionID="Hx2000055701"
#EMBLAccession="LT618799"
#IMGTID="DSFSKJF"

# This works for downloading the documentation.
#curl -o 'Documentation.pdf' -X GET --header 'Accept: application/pdf' 'https://www.ebi.ac.uk/ena/portal/api/doc?format=pdf' 

# This works, for hitting the allele calling service:
#curl -X GET --header 'Accept: application/json' 'http://act.b12x.org/act?locus=HLA-A&sequence=CAGGAGCAGAGGGGTCAGGGCGAAGTCCCAGGGCCCCAGGCGTGGCTCTCAGGGTCTCAGGCCCCGAAGGCGGTGTATGGATTGGGGAGTCCCAGCCTTGGGGATTCCCCAACTCCGCAGTTTCTTTTCTCCCTCTCCCAACCTACGTAGGGTCCTTCATCCTGGATACTCACGACGCGGACCCAGTTCTCACTCCCATTGGGTGTCGGGTTTCCAGAGAAGCCAATCAGTGTCGTCGCGGTCGCTGTTCTAAAGTCCGCACGCACCCACCGGGACTCAGATTCTCCCCAGACGCCGAGGATGGCCGTCATGGCGCCCCGAACCCTCCTCCTGCTACTCTCGGGGGCCCTGGCCCTGACCCAGACCTGGGCGGGTGAGTGCGGGGTCGGGAGGGAAACCGCCTCTGCGGGGAGAAGCAAGGGGCCCTCCTGGCGGGGGCGCAGGACCGGGGGAGCCGCGCCGGGAGGAGGGTCGGGCAGGTCTCAGCCACTGCTCGCCCCCAGGCTCCCACTCCATGAGGTATTTCTTCACATCCGTGTCCCGGCCCGGCCGCGGGGAGCCCCGCTTCATCGCCGTGGGCTACGTGGACGACACGCAGTTCGTGCGGTTCGACAGCGACGCCGCGAGCCAGAAGATGGAGCCGCGGGCGCCGTGGATAGAGCAGGAGGGGCCGGAGTATTGGGACCAGGAGACACGGAATATGAAGGCCCACTCACAGACTGACCGAGCGAACCTGGGGACCCTGCGCGGCTACTACAACCAGAGCGAGGACGGTGAGTGACCCCGGCCCGGGGCGCAGGTCACGACCCCTCATCCCCCACGGACGGGCCAGGTCGCCCACAGTCTCCGGGTCCGAGATCCACCCCGAAGCCGCGGGACTCCGAGACCCTTGTCCCGGGAGAGGCCCAGGCGCCTTTACCCGGTTTCATTTTCAGTTTAGGCCAAAAATCCCCCCGGGTTGGTCGGGGCGGGGCGGGGCTCGGGGGACTGGGCTGACCGCGGGGTCGGGGCCAGGTTCTCACACCATCCAGATAATGTATGGCTGCGACGTGGGGCCGGACGGGCGCTTCCTCCGCGGGTACCGGCAGGACGCCTACGACGGCAAGGATTACATCGCCCTGAACGAGGACCTGCGCTCTTGGACCGCGGCGGACATGGCAGCTCAGATCACCAAGCGCAAGTGGGAGGCGGTCCATGCGGCGGAGCAGCGGAGAGTCTACCTGGAGGGCCGGTGCGTGGACGGGCTCCGCAGATACCTGGAGAACGGGAAGGAGACGCTGCAGCGCACGGGTACCAGGGGCCACGGGGCGCCTCCCTGATCGCCTATAGATCTCCCGGGCTGGCCTCCCACAAGGAGGGGAGACAATTGGGACCAACACTAGAATATCACCCTCCCTCTGGTCCTGAGGGAGAGGAATCCTCCTGGGTTTCCAGATCCTGTACCAGAGAGTGACTCTGAGGTTCCGCCCTGCTCTCTGACACAATTAAGGGATAAAATCTCTGAAGGAGTGACGGGAAGACGATCCCTCGAATACTGATGAGTGGTTCCCTTTGACACCGGCAGCAGCCTTGGGCCCGTGACTTTTCCTCTCAGGCCTTGTTCTCTGCTTCACACTCAATGTGTGTGGGGGTCTGAGTCCAGCACTTCTGAGTCTCTCAGCCTCCACTCAGGTCAGGACCAGAAGTCGCTGTTCCCTTCTCAGGGAATAGAAGATTATCCCAGGTGCCTGTGTCCAGGCTGGTGTCTGGGTTCTGTGCTCTCTTCCCCATCCCGGGTGTCCTGTCCATTCTCAAGATGGCCACATGCGTGCTGGTGGAGTGTCCCATGACAGATGCAAAATGCCTGAATTTTCTGACTCTTCCCGTCAGACCCCCCCAAGACACATATGACCCACCACCCCATCTCTGACCATGAGGCCACCCTGAGGTGCTGGGCCCTGGGCTTCTACCCTGCGGAGATCACACTGACCTGGCAGCGGGATGGGGAGGACCAGACCCAGGACACGGAGCTCGTGGAGACCAGGCCTGCAGGGGATGGAACCTTCCAGAAGTGGGCGGCTGTGGTGGTGCCTTCTGGAGAGGAGCAGAGATACACCTGCCATGTGCAGCATGAGGGTCTGCCCAAGCCCCTCACCCTGAGATGGGGTAAGGAGGGAGATGGGGGTGTCATGTCTCTTAGGGAAAGCAGGAGCCTCTCTGGAGACCTTTAGCAGGGTCAGGGCCCCTCACCTTCCCCTCTTTTCCCAGAGCTGTCTTCCCAGCCCACCATCCCCATCGTGGGCATCATTGCTGGCCTGGTTCTCCTTGGAGCTGTGATCACTGGAGCTGTGGTCGCTGCCGTGATGTGGAGGAGGAAGAGCTCAGGTGGAGAAGGGGTGAAGGGTGGGGTCTGAGATTTCTTGTCTCACTGAGGGTTCCAAGCCCCAGCTAGAAATGTGCCCTGTCTCATTACTGGGAAGCACCTTCCACAATCATGGGCCGACCCAGCCTGGGCCCTGTGTGCCAGCACTTACTCTTTTGTAAAGCACCTGTTAAAATGAAGGACAGATTTATCACCTTGATTACGGCGGTGATGGGACCTGATCCCAGCAGTCACAAGTCACAGGGGAAGGTCCCTGAGGACAGACCTCAGGAGGGCTATTGGTCCAGGACCCACACCTGCTTTCTTCATGTTTCCTGATCCCGCCCTGGGTCTGCAGTCACACATTTCTGGAAACTTCTCTGGGGTCCAAGACTAGGAGGTTCCTCTAGGACCTTAAGGCCCTGGCTCCTTTCTGGTATCTCACAGGACATTTTCTTCCCACAGATAGAAAAGGAGGGAGTTACACTCAGGCTGCAAGTAAGTATGAAGGAGGCTGATGCCTGAGGTCCTTGGGATATTGTGTTTGGGAGCCCATGGGGGAGCTCACCCACCCCACAATTCCTCCTCTAGCCACATCTTCTGTGGGATCTGACCAGGTTCTGTTTTTGTTCTACCCCAGGCAGTGACAGTGCCCAGGGCTCTGATGTGTCTCTCACAGCTTGTAAAGGTGAGAGCTTGGAGGGCCTGATGTGTGTTGGGTGTTGGGTGGAACAGTGGACACAGCTGTGCTATGGGGTTTCTTTGCGTTGGATGTATTGAGCATGCGATGGGCTGTTTAAGGTGTGACCCCTCACTGTGATGGATATGAATTTGTTCATGAATATTTTTTTCTATAGTGTGAGACAGCTGCCTTGTGTGGGACTGAGAGGCAAGAGTTGTTCCTGCCCTTCCCTTTGTGACTTGAAGAACCCTGACTTTGTTTCTGCAAAGGCACCTGCATGTGTCTGTGTTCGTGTAGGCATAATGTGAGGAGGTGGGGAGAGCACCCCACCCCCATGTCCACCATGACCCTCTTCCCACGCTGACCTGTGCTCCCTCTCCAATCATCTTTCCTGTTCCAGAGAGGTGGGGCTGAGGTGTCTCCATCTCTGTCTCAACTTCATGGTGCACTGAGCTGTAACTTCTTCCTTCCCTATTAAAA'

# This works, for getting samples from ENA.
#curl -X GET --header 'Accept: text/plain' -u username:password 'https://www.ebi.ac.uk/ena/portal/api/search?result=sample&limit=10'


# To print all the samples to a file
# I don't think this is what i want. I can only see accession numbers and I don't recognize them.
# curl -o 'AllSamples.txt' -X GET --header 'Accept: text/plain' -u username:password 'https://www.ebi.ac.uk/ena/portal/api/search?result=sample'
#curl -o 'AllSamples.txt' -X GET --header 'Accept: text/plain' -u username:password 'https://www.ebi.ac.uk/ena/portal/api/search?result=sequence_release&query=accession=LT618799&fields=accession,sample_accession,description,study_accession'
#curl -o 'AllSamples.txt' -X GET --header 'Accept: text/plain' -u username:password 'https://www.ebi.ac.uk/ena/portal/api/search?result=analysis&fields=accession,sample_accession,description,study_accession'
#curl -o 'AllSamples.txt' -X GET --header 'Accept: text/plain' -u username:password 'https://www.ebi.ac.uk/ena/portal/api/search?result=sequence_release&query=accession=LT618799&fields=accession,sample_accession,description,study_accession'

# With a query command, this is working too.
#curl -X GET --header 'Accept: text/plain' -u username:password 'https://www.ebi.ac.uk/ena/portal/api/search?result=sample&query=collection_date>=2016-01-01&limit=200'

#Pg14- A full list of the latest result fields can be fetched from the following endpoint:
#/searchFields?result=<resultId> 
# These are the searchable fields. Can I 
#curl -o 'SearchableFields.txt' -X GET --header 'Accept: text/plain' -u username:password 'https://www.ebi.ac.uk/ena/portal/api/searchFields?result=sample'
 
 
# Get returnable fields
#curl -o 'ReturnableFields.txt' -X GET --header 'Accept: text/plain' -u username:password 'https://www.ebi.ac.uk/ena/portal/api/returnFields?result=sample'
