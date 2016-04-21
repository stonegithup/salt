check_md5(){
    projectname=$2
    domainname=$1
    version=$3
    [[ -z "$domainname" || -z "$version" ]] && help
    CHECKURL=http://10.44.136.43/md5?$domainname=$version\&war=$projectname
    Re=`curl -H "HOST:downloadwar" $CHECKURL  2>>/dev/null `
    if echo $Re|grep "True" >> /dev/null
    then
        echo 0
    else
        echo 1
    fi
}
check_md5 PublicCloud ucoffice 3.0.5.53
