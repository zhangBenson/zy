string item_rank(string org)
{
	map <int,string> index_value;
	map <int,string>::iterator it;
	typedef pair<int,string> ispair;
	int index=0;
	string value;
	int h,t;
	h=org.find("\t\t<item");
	while(h!=-1)
	{
		t=org.find("</item",h);
		if(t==-1)
			break;
		value=org.substr(h+9,t-h-9);
		if(org.at(h+7)=='1')
		{
			index=1;
			index_value.insert(ispair(index,value));
		}
		if(org.at(h+7)=='2')
		{
			index=2;
			index_value.insert(ispair(index,value));
		}
		if(org.at(h+7)=='3')
		{
			index=3;
			index_value.insert(ispair(index,value));
		}
		if(org.at(h+7)=='4')
		{
			index=4;
			index_value.insert(ispair(index,value));
		}
		if(org.at(h+7)=='5')
		{
			index=5;
			index_value.insert(ispair(index,value));
		}
		if(org.at(h+7)=='6')
		{
			index=6;
			index_value.insert(ispair(index,value));
		}
		if(org.at(h+7)=='7')
		{
			index=7;
			index_value.insert(ispair(index,value));
		}
		t=org.find("\n",h);
		org.replace(h,t-h+1,"");
		h=org.find("\t\t<item");
	}
	
	for(index=1;index<=index_value.size();index++)
	{
		it=index_value.find(index);
		if(it!=index_value.end())
		{
			h=org.find("\t</query>");
			if(h!=-1)
			{
				value="\t\t<item>"+it->second+"</item>\n\t";
				org.replace(h,1,value);
			}
		}
	}
	
	return org;
}
string rank(string org)
{
	int h,t;
	string substring;
	h=org.find("<query>");
	t=org.find("</query>",h);
	while(h!=-1&&t!=-1)
	{
		substring=org.substr(h,t+10-h);
		substring=item_rank(substring);
		org.replace(h,t+10-h,substring);
		t=h+substring.length();
		h=org.find("<query>",t);
		t=org.find("</query>",h);
	}
	
	return org;
}
string clean(string str)
{
	int h,t;
	h=str.find(">\t");
	t=str.find("> ");
	while(h!=-1||t!=-1)
	{
		if(h!=-1)
			str.replace(h,2,">");
		else if(t!=-1)
			str.replace(t,2,">");
		h=str.find(">\t");
		t=str.find("> ");
	}
	h=str.find("\t</it");
	t=str.find(" </it");
	while(h!=-1||t!=-1)
	{
		if(h!=-1)
			str.replace(h,1,"");
		else if(t!=-1)
			str.replace(t,1,"");
		h=str.find("\t</it");
		t=str.find(" </it");
	}
	h=str.find("\t</ques");
	t=str.find(" </ques");
	while(h!=-1||t!=-1)
	{
		if(h!=-1)
			str.replace(h,1,"");
		else if(t!=-1)
			str.replace(t,1,"");
		h=str.find("\t</ques");
		t=str.find(" </ques");
	}
	
	h=str.find("\t</ans");
	t=str.find(" </ans");
	while(h!=-1||t!=-1)
	{
		if(h!=-1)
			str.replace(h,1,"");
		else if(t!=-1)
			str.replace(t,1,"");
		h=str.find("\t</ans");
		t=str.find(" </ans");
	}
	
	return str;
}
string rplc(string org, string key, string str_p, string str_a)
{
	string str,key2;
	if(str_a=="NULL")
		str_a="";
	int h,t, pst;
	key2="</"+key.substr(1,key.length()-1);
	h=org.find(key);
	while(h!=-1)
	{
		t=org.find(key2,h+2);
		if(t==-1)
			break;
		str=org.substr(h+key.length(),t-h-key.length());
		pst=str.find(str_p);
		while(pst!=-1)
		{
			str.replace(pst, str_p.length(),str_a);
			pst=str.find(str_p);
		}
		org.replace(h+key.length(),t-h-key.length(),str);
		
		h=org.find(key,h+2);
	}
	return org;
}
string norm(string org, set <string> norms)
{
	set <string> ::iterator it;
	it=norms.begin();
	string key, str_p, str_a, str;
	int h,t;
	while(it!=norms.end())
	{
		str=*it;
		h=str.find("###&&###");
		if(h==-1)
			break;
		key=str.substr(0,h);
		h=h+8;
		t=str.find("###&&###",h);
		if(t==-1)
			break;
		str_p=str.substr(h,t-h);
		str_a=str.substr(t+8,str.length()-t-8);
		//cout<<key<<"\t"<<str_p<<"\t"<<str_a<<endl
		if(key=="${1}")
			key="<item1>";
		else if(key=="${2}")
			key="<item2>";
		else if(key=="${3}")
			key="<item3>";
		else if(key=="${4}")
			key="<item4>";
		else if(key=="${5}")
			key="<item5>";
		else if(key=="${6}")
			key="<item6>";
		else if(key=="${7}")
			key="<item7>";
		else if(key=="${a}")
			key="<answer>";
		else if(key=="${Q}")
			key="<question>";
		org=rplc(org,key, str_p,str_a);
		it++;
	}
	//cout<<org<<endl;
	org=clean(org);
	org=rank(org);
	return org;
}