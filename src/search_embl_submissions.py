import sys
import os
import getopt
import requests
#from requests import ApiError

# Read Commandline Arguments.  Return true if everything looks okay for read extraction.
def readArgs():
    # Default to None.  So I can easily check if they were not passed in.
   
    global submissionID            

    submissionID = None

    # https://www.tutorialspoint.com/python/python_command_line_arguments.htm
    try:
        opts, args = getopt.getopt(sys.argv[1:]
            ,"s:"
            ,[ "submissionid="])

        for opt, arg in opts:
            
            if opt in ("-s", "--submissionid"):
                submissionID = arg
                
            else:
                print('Unknown Commandline Option:' + str(opt) + ':' + str(arg))
                raise Exception('Unknown Commandline Option:' + str(opt) + ':' + str(arg))

    except getopt.GetoptError, errorMessage:
        print ('Something seems wrong with your commandline parameters.')
        print (errorMessage)
        return False
    
    return True

def getEMBLSubmission():
    print ('Now I will get the EMBL submission with ID:' + submissionID)
    
    
    #https://www.ebi.ac.uk/ena/portal/api/#!/Portal_API/getReturnFieldsUsingGET
    
    resp = requests.get('https://www.ebi.ac.uk/ena/portal/api/returnFields?result=A')
    if resp.status_code != 200:
        # This means something went wrong.
        raise Exception('GET /tasks/ {}'.format(resp.status_code))
    for todo_item in resp.json():
        print('{} {}'.format(todo_item['id'], todo_item['summary']))


if __name__=='__main__':
    
    try:    
        if(readArgs()):
            print('Commandline arguments look fine.\n')
            
            getEMBLSubmission()
            
            print ('Done with nit-picker for now. Have a nice day.')    
        else:
            print('\nI\'m giving up because I was not satisfied with your commandline arguments.')  
            
    except Exception:
        # Top Level exception handling like a pro.
        # This is not really doing anything.
        print 'Fatal problem:'
        print sys.exc_info()
        raise
   