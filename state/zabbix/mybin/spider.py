#coding=utf-8
import sys
import urllib2,re
import formatter
from HTMLParser import HTMLParser 
buf=""
#下载模块
def download(URL):
    global buf
    #URL=URL.encode("utf-8")
    try :
        f=urllib2.urlopen(URL,timeout=5)
    except:
        return
    buf=f.read()
    f.close()
    return buf
#URL链接分析模块
def get_file_size(URL):
    request = urllib2.Request(URL)
    request.get_method = lambda: 'HEAD' 
    try :
        response = opener.open(request)
	respose.read()
    except Exception,e:
        return
    return dict(response.headers).get('content-length', 0) 
class MyHTMLParser(HTMLParser): 
    def __init__(self): 
        HTMLParser.__init__(self) 
        self.links = [] 
    def handle_starttag(self, tag, attrs): 
        #print "Encountered the beginning of a %s tag" % tag 
#        if tag == "a": 
#            if len(attrs) == 0: 
#                pass 
#            else: 
#                for (variable, value) in attrs: 
#                    if variable == "href": 
#                        self.links.append(value) 

        if tag == "img": 
            if len(attrs) == 0: 
                pass 
            else: 
                for (variable, value) in attrs: 
                    if variable == "src": 
                        self.links.append(value) 

        if tag == "script": 
            if len(attrs) == 0: 
                pass 
            else: 
                for (variable, value) in attrs: 
                    if variable == "src": 
                        self.links.append(value) 

        if tag == "link": 
            if len(attrs) == 0: 
                pass 
            else: 
                for (variable, value) in attrs: 
                    if variable == "src": 
                        self.links.append(value) 

def True_url(url):
    pattern1="^https?://*"
    pattern2="^/.*/$"
    if re.search(pattern1,url):
       return url
    elif re.search(pattern2,url):
       #return "%s%s" %(URL,url)
       url= URL+url
       print url
       return url
    else:
       pass

if __name__ == "__main__":
    #下载模块
    URL=sys.argv[1]
    download(URL)
    try:
        buf=download(URL)
    except:
        buf=""
    try: 
        hp = MyHTMLParser() 
        hp.feed(buf) 
        hp.close() 
    except:
	print URL
	sys.exit()
    tmp_url=[]
    bad_url=[]
    for n in hp.links:
	#判断n 是否为 完整的链接
        tmpurl=True_url(n)
	if tmpurl is not None:
            if isinstance(tmpurl,unicode): 
                #s=u"中文" 
                #tmpurl=tmpurl.decode('gb2312').encode('utf-8')
                tmpurl=tmpurl.decode('gb2312').encode('utf8')
                #print "GB2312"
            else: 
                #s="中文" 
                #tmpurl=tmpurl.decode('gb2312').encode('utf8')
                #tmpurl=tmpurl
		pass
                #详细出处参考：http://www.jb51.net/article/17560.htm
                #tmpurl=tmpurl.decode('gb2312').encode('utf-8')
            tmp_url.append(tmpurl)

    for url in tmp_url:
	try:
	    buf=get_file_size(url)
	except:
    	    buf=""
	    pass
	if buf == "":
	    bad_url.append(url)
    if len(bad_url) != 0:
	for i in bad_url:
	    print i
    else:
	print "OK"
