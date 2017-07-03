import sys
import os
import getopt
import requests


import StringIO


if __name__=='__main__':
    
    try:    
        
    
        requestURL = ('https://www-test.ebi.ac.uk/ena/submit/drop-box/submit/'
                      
            )
        # Try passing the authorization as a params payload
        paramsPayload = {
            'auth':'ENA c.voorter@mumc.nl notpassword'
            
            }
        
        #projectSubmissionText='<?xml version="1.0" ?><SUBMISSION alias="proj_sub_2017_06_30_12_45_20" center_name="Maastricht University Medical Center"><ACTIONS><ACTION><ADD schema="project" source="project.xml"/></ACTION></ACTIONS></SUBMISSION>'
        #projectText='<?xml version="1.0" ?><PROJECT_SET><PROJECT alias="HLA_Analysis_Project" center_name="Maastricht University Medical Center"><TITLE>Our laboratory performs HLA typing for Research</TITLE><DESCRIPTION>An abstract is a more in-depth description of the nature of the research project.</DESCRIPTION><SUBMISSION_PROJECT><SEQUENCING_PROJECT/></SUBMISSION_PROJECT></PROJECT></PROJECT_SET>'        
        
        
        print ('URL=\n'+str(requestURL))
        
        multiple_files = [            
            ('SUBMISSION', ('project_submission.xml', open('/home/ben/Github/rest-accessor/src/project_submission.xml', 'rb'), 'text/xml'))
            ,('PROJECT', ('project.xml', open('/home/ben/Github/rest-accessor/src/project.xml', 'rb'), 'text/xml'))
         
        ]
        
                
        requestHeaders = {
            'Content-Type': 'multipart/form-data'
            }
        
       
        #postResponse = requests.get(
        postResponse = requests.post(
            requestURL
            , params=paramsPayload
            #, data=requestData
            #, data=multiple_files
            , files=multiple_files
          #  , files=files
            #, data=files
            , headers=requestHeaders
            #, verify=False
            #, SUBMISSION=projectSubmissionText
            #, PROJECT=projectText
#                    , auth=requestUser
            #, auth=(getConfigurationValue('embl_username'), getConfigurationValue('embl_password'))
            )
        
        print ('\nthe request in the response is:\n' + str(postResponse.request))
        postResponse.request
        
        
        print ('\nthe request in the response body is:\n' + str(postResponse.request.body))
        postResponse.request.body
        print ('\nthe request in the response headers is:\n' + str(postResponse.request.headers))
        postResponse.request.headers
        
        print ('\nthe response URL is:\n' + str(postResponse.url))
        
        print ('\nresponse History is:\n' + str(postResponse.history))
        
        print ('\nthe post response object:\n' + str(postResponse))
        postResponse
        
        # Keep the Headers.  I know if the response is HTML or XML based on these headers.
        print('\nresponse headers:' + str(postResponse.headers))
        
        print ('\nresponse status:\n' + str(postResponse.status_code))
        
        print('\nresponse text:' + str(postResponse.text))
        
        print('\nresponse content:' + str(postResponse.content))
        
        print('\nis response okay?:' + str(postResponse.status_code == requests.codes.ok))
         
            
    except Exception:
        # Top Level exception handling like a pro.
        # This is not really doing anything.
        print 'Fatal problem:'
        print sys.exc_info()
        raise
   