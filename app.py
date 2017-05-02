
# coding: utf-8

# In[1]:


# Computer Vision API

# In[1]:
from __future__ import print_function
import bing_voice
from bing_voice import *
import pyaudio
import sys
import wave
import os
from bottle import route, run
from bottle import template
import time 
import requests

import operator
import numpy as np
# Import library to display results
from bottle import request
from bottle import static_file,get
import urllib
#os.chdir("C:\Indira\Code\BottleApp")



# In[2]:

_url = 'https://westus.api.cognitive.microsoft.com/vision/v1.0/analyze?'
_key = 'ddd4c6b08a344f8494939e814aa45339'
_maxNumRetries = 10  
@get("/static/img/<filepath:re:.*\.(jpg|png|gif|ico|svg)>")
def img(filepath):
    return static_file(filepath, root="static/images/work/")

@get("/tmp/upload/<filepath:re:.*\.(jpg|png|gif|ico|svg)>")
def img(filepath):
    return static_file(filepath, root="tmp/upload/")

    
@get("/static/css/<filepath:re:.*\.css>")
def css(filepath):
    return static_file(filepath, root="static/css/")

@get("/static/js/<filepath:re:.*\.js>")
def js(filepath):
    return static_file(filepath, root="static/js/")



# In[3]:

def processRequest( json, data, headers, params ):

    """
    Helper function to process the request to Project Oxford

    Parameters:
    json: Used when processing images from its URL. See API Documentation
    data: Used when processing image read from disk. See API Documentation
    headers: Used to pass the key information and the data type request
    """

    retries = 0
    result = None
    while True:

        response = requests.request( 'post', _url, json = json, data = data, headers = headers, params = params )

        if response.status_code == 429: 

            print( "Message: %s" % ( response.json()['message'] ) )
            
            if retries <= _maxNumRetries: 
                time.sleep(1) 
                retries += 1
                continue
            else: 
                print( 'Error: failed after retrying!' )
                break

        elif response.status_code == 200 or response.status_code == 201:

            if 'content-length' in response.headers and int(response.headers['content-length']) == 0: 
                result = None 
            elif 'content-type' in response.headers and isinstance(response.headers['content-type'], str): 
                if 'application/json' in response.headers['content-type'].lower(): 
                    result = response.json() if response.content else None 
                elif 'image' in response.headers['content-type'].lower(): 
                    result = response.content
        else:
            print( "Error code: %d" % ( response.status_code ) )
            print( "Message: %s" % ( response.json()['message'] ) )
            print("Here")
        break
        
    return result


# In[4]:

def renderResultOnImage( result, img ):
   
    """Display the obtained results onto the input image"""

    R = int(result['color']['accentColor'][:2],16)
    G = int(result['color']['accentColor'][2:4],16)
    B = int(result['color']['accentColor'][4:],16) ;
    cv2.rectangle( img,(0,0), (img.shape[1], img.shape[0]), color = (R,G,B), thickness = 25 )

    if 'description' in result:
        desc = result['description']['captions'][0]['text']
        cv2.putText( img, desc, (100,200), cv2.FONT_HERSHEY_SCRIPT_SIMPLEX, 1, (73,25,180), 2 )
        print(desc)


# In[5]:

@route('/edit')
def edit():
    info = []
    return template('simple.tpl', info)


@route('/vision')
def vision():
    
    datadic = {        
        'category ' : "",
        'description' : "",
        'tags' : list()
    }
    return(template("vision.tpl",datadic = datadic,img = "/static/img/default.png"))


# In[9]:

@route('/vision/show', method = 'POST')
def upload():
       
    #p = os.path.join(os.getcwd(),"tmp/upload/", upload.filename)
        
    #p = os.path.join(os.getcwd(),"tmp/upload/", upload.filename)
    #upload.save(p)
       
    upload = request.files.get('upload')
    name, ext = os.path.splitext(upload.filename)
    if ext not in ('.png', '.jpg', '.jpeg'):
        return "File extension not allowed."

    save_path = "tmp/upload"
    if not os.path.exists(save_path):
        os.makedirs(save_path)

   
    
    file_path = "{path}/{file}".format(path=save_path, file=upload.filename)
    try:
        os.remove(file_path)
    except Exception as e:
        pass
    upload.save(file_path)
    
    with open( file_path, 'rb' ) as f:
        data = f.read()
   
    # Computer Vision parameters
    params = { 'visualFeatures' : 'Color,Categories,Faces,Description'} 

    headers = {}
    headers['Ocp-Apim-Subscription-Key'] = _key
    #headers['Content-Type'] = 'application/json' 
    headers['Content-Type'] = 'application/octet-stream'
    json = None
    #json = { 'url': urlImage } 
    #data = None
    res = processRequest( json, data, headers, params)
    print(res)
       
    if res is not None: 
        datadic = { 'category' : res['categories'][0]['name']  , 'description': res['description']['captions'][0]['text'] ,
                   'tags':  res['description']['tags'][:5]}
        print(datadic)
        
        return template('vision.tpl',datadic=datadic, img="/"+file_path )  
 


# In[10]:
#run(host='localhost', port=8080, debug=True)


# In[12]:

## Text To Speech
@route('/tts',method = "POST")
def tts():      
    # get a key from https://www.microsoft.com/cognitive-services/en-us/speech-api
    BING_KEY = '756f8cbc3ad54b209076e4e41b51ecc2'
    CHUNK_SIZE = 2048

    text   = request.forms.get('t')
  

    bing = BingVoice(BING_KEY)
    data = bing.synthesize(text)

    pa = pyaudio.PyAudio()
    stream = pa.open(format=pyaudio.paInt16,
                     channels=1,
                     rate=16000,
                     output=True,
                     # output_device_index=1,
                     frames_per_buffer=CHUNK_SIZE)

    stream.write(data)
    stream.close()

    if len(text) >= 3:
        wf = wave.open(sys.argv[2], 'wb')
        wf.setframerate(16000)
        wf.setnchannels(1)
        wf.setsampwidth(2)

        wf.writeframes(data)
        wf.close()


    #return template('tts.tpl', info)


# In[13]:

@route('/tts')
def tts():      
    return(template('tts.tpl'))


# In[14]:

@route('/spellcheck')
def spellcheck():      
    return(template('spellcheck.tpl',opstr = ''))


# In[15]:

import  httplib
@route('/spellcheck',method = "POST")
def spellcheckpost():
    headers = {
    # Request headers
    'Ocp-Apim-Subscription-Key': 'baf9b2caff1849c08a4428bf637cbbb4',
    'Content-Type': 'application/x-www-form-urlencoded',
    }
    text   = request.forms.get('t')
    s= text
    text = "Text=" + text
    params = urllib.urlencode({
        
        'mode': 'proof',
        'mkt': 'en-us',
    })
    
    
    try:
        conn = httplib.HTTPSConnection('api.cognitive.microsoft.com')
        conn.request("POST", "/bing/v5.0/spellcheck/?%s" % params,text, headers)
        response = conn.getresponse()
        data = response.read()
        print(data)
        conn.close()
    except Exception as e:
           print(e)
    print(s)
    jsondata = json.loads(data)
    for row in jsondata['flaggedTokens']:
        position =  row['offset']
        #print(row['token'])
        replacement = row['suggestions'][0]['suggestion'] ## suggestion with the maximum score 
        length_of_replaced= len(replacement)
        if(len(row['token']) < length_of_replaced):
               s = s[:position] + replacement + " " + s[position+length_of_replaced:]
        else:
               s = s[:position] + replacement  + s[position+length_of_replaced:]
    

    return(template('spellcheck.tpl',opstr = s))


if __name__ == '__main__':
    # Bind to PORT if defined, otherwise default to 5000.
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)