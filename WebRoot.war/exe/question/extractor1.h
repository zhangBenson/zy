#include <string>
#include <sstream>
#include <set>
#include <map> 
#include <sys/types.h>
#include <regex.h>


using namespace std;

#include "norm.h"

std::string int2str(int number)
{
   std::stringstream ss;//create a stringstream
   ss << number;//add number to the stream
   return ss.str();//return a string with the contents of the stream
}

string remove_meta(string str)
{
	int pst1, pst2=2;
	pst1=str.find("<");
	while(pst1!=-1)
	{
		pst2=str.find(">",pst1);
		if(pst2!=-1)
			str.replace(pst1,pst2-pst1+1,"");
		else
			break;
		pst1=str.find("<");
	}
	
	return str;
}
/*
int condition_checker(string str)
{
	if(str.find(" A. ")!=-1)
		return 1;
	if(str.find(" B. ")!=-1)
		return 1;
	if(str.find(" C. ")!=-1)
		return 1;
	if(str.find(" D. ")!=-1)
		return 1;
	if(str.find(" E. ")!=-1)
		return 1;
	if(str.find("A ")==0)
		return 2;
	if(str.find("B ")==0)
		return 2;
	if(str.find("C ")==0)
		return 2;
	if(str.find("D ")==0)
		return 2;
	if(str.find("E ")==0)
		return 2;
	if(str.find(" a. ")!=-1)
		return 3;
	if(str.find(" b. ")!=-1)
		return 3;
	if(str.find(" c. ")!=-1)
		return 3;
	if(str.find(" d. ")!=-1)
		return 3;
	if(str.find(" e. ")!=-1)
		return 3;
	if(str.find("a ")==0)
		return 4;
	if(str.find("b ")==0)
		return 4;
	if(str.find("c ")==0)
		return 4;
	if(str.find("d ")==0)
		return 4;
	if(str.find("e ")==0)
		return 4;
		
	if(str.find("(1) ")!=-1)
		return 5;
	if(str.find("(2) ")!=-1)
		return 5;
	if(str.find("(3) ")!=-1)
		return 5;
	if(str.find("(4) ")!=-1)
		return 5;
	if(str.find("(1)\t")!=-1)
		return 6;
	if(str.find("(2)\t")!=-1)
		return 6;
	if(str.find("(3)\t")!=-1)
		return 6;
	if(str.find("(4)\t")!=-1)
		return 6;
	
	return 0;
}


int output_json(int cond, int pst,const string& content, int end)
{
	int b, e, pst1, pst2, cond_p;
	string query,str;
	pst1=content.rfind("</FONT>",pst);
	if(pst1==-1)
		return end;
	
		pst2=content.rfind("<FONT",pst1);
		if(pst2==-1)
			return end;
		pst=pst2;
		pst1=content.rfind("</FONT>",pst2);
		if(pst1==-1)
			return end;
		pst2=content.rfind("<FONT",pst1);
		if(pst2==-1)
			return end;
		
		query=content.substr(pst2, pst1-pst2);
		query=remove_meta(query);
		//cout<<query<<endl;
		if(condition_checker(query)==cond)
			return end;
		b=pst2;
		
		pst1=content.find("<FONT",pst-1);
		if(pst1==-1)
			return end;
		pst2=content.find("</FONT>",pst1);
		if(pst2==-1)
			return end;
			
		cout<<"{\"ID\":\""<<id<<"\", \"QUESTION\": \""
		<<query<<"\", \"OPTION\": [\"";
		id++;
		str=content.substr(pst1,pst2-pst1);
		str=remove_meta(str);
		cond_p=condition_checker(str);
		
		cout<<str<<"\"";
		e=pst2;
		while(cond_p==cond)
		{
			pst1=content.find("<FONT",pst2);
			if(pst1==-1)
				break;
			pst2=content.find("</FONT>",pst1);
			if(pst2==-1)
				break;
			str=content.substr(pst1,pst2-pst1);
			str=remove_meta(str);
			cond_p=condition_checker(str);
			if(cond_p==cond)
			{
				e=pst2;
				cout<<", \""<<str<<"\"";
			}
		}
	cout<<"], \"IMG\": [\"";
	str=content.substr(b,e-b);
	pst1=str.find("<IMG SRC=\"");
	if(pst1!=-1)
	{
		pst2=str.find("\"",pst1+11);
		if(pst2!=-1)
		{
			pst1=str.rfind("/",pst2);
			cout<<str.substr(pst1+1,pst2-pst1-1);
			pst1=str.find("<IMG SRC=\"",pst2);
			while(pst1!=-1)
			{
				pst2=str.find("\"",pst1+11);
				if(pst2==-1)
					break;
				pst1=str.rfind("/",pst2);
				cout<<"\", \""<<str.substr(pst1+1,pst2-pst1-1);
				pst1=str.find("<IMG SRC=\"",pst2);
			}
	
		}
	}
	cout<<"\"]}\n";
	return e;
}
*/

string rewrite(string REq)
{
	int h;
	/*h=REq.find("^");
	if(h==0)
	{
		REq.replace(h,1,"ENDOFLINE");
	}*/
	
	h=REq.find("\\n");
	while(h!=-1)
	{
		REq.replace(h,2,"ENDOFLINE");
		h=REq.find("\\n");
	}
	
	h=REq.find("\\t");
	while(h!=-1)
	{
		REq.replace(h,2,"\t");
		h=REq.find("\\t");
	}
	return REq;
}

int REq_find(string content_clean, string content, string REq, string REa, string* output_s, map<int,string> row_img)
{
	int q_no;
	q_no=0;
	
	REq=rewrite(REq);
	
	map <int,string> index_item, index_substring;
	map <int,string> ::iterator it_map;
	typedef pair <int,string> ispair;
	int index=1;
	string item, substring;
	int ans_b;
	string ans_str;
	regex_t reg;
	const char *regex="\\$\\{[1-9a-zA-Z]\\}";
	const char *str=REq.c_str();
	regmatch_t matches[16];

	regcomp(&reg, regex, REG_EXTENDED);
	int conunt,h,t;
	h=0;
	while(regexec(&reg, str, 16, matches, 0) == 0)
	{
		item=REq.substr(matches[0].rm_so, matches[0].rm_eo-matches[0].rm_so);
		t=matches[0].rm_so;
		substring=REq.substr(h,t-h);
		h=matches[0].rm_eo;
		index_item.insert(ispair(index,item));
		index_substring.insert(ispair(index,substring));
		REq.replace(matches[0].rm_so,matches[0].rm_eo-matches[0].rm_so,"(.*)");
		str=REq.c_str();
		index++;
	}
	t=REq.length();
	substring=REq.substr(h,t-h);
	index_substring.insert(ispair(index,substring));
	
	
	int tag=1;
	str=content_clean.c_str();
	string str_2=content_clean;
	int row_no=0;
	int row;
	int row_tag;
	string str_p, str_t;
	set <int> imgs;
	set <int>::iterator it_set;
	*output_s="<doc>\n";
	int id;
	id=0;
	imgs.clear();
	ans_b=0;
	while(tag==1)
	{
		for(int i=1;i<=index_substring.size();i++)
		{
			it_map=index_substring.find(i);
			index=it_map->first;
			substring=it_map->second;
			regex=substring.c_str();
		//	cout<<substring<<endl;
			//cout<<str<<endl;
			regcomp(&reg, regex, REG_EXTENDED);
			if(regexec(&reg, str, 16, matches, 0) == 0)
			{
				if(index==2&&id!=0)
				{
					it_map=row_img.begin();
					while(it_map!=row_img.end())
					{
						row=it_map->first;
						//cout<<row<<"\t"<<row_no<<endl;
						if(row<=row_no)
						{
							imgs.insert(row);
							str_t=it_map->second;
							*output_s=*output_s+"\t\t<img>"+str_t+"</img>\n\t\t\n\t</query>\n";
						}
						it_map++;
					}
					if(imgs.size()==0)
					{
						*output_s=*output_s+"\t\t<img>"+"NULL"+"</img>\n\t\t\n\t</query>\n";
					}
				}
				//cout<<content_clean.substr(matches[0].rm_so, matches[0].rm_eo-matches[0].rm_so)<<endl;
				if(index!=1)
				{
					//cout<<str_2.substr(0,matches[0].rm_so)<<endl;
					str=str_2.c_str();
					it_map=index_item.find(index-1);
					if(it_map!=index_item.end())
					{
						str_t=it_map->second;
						if(str_t=="${Q}")
						{
							
							*output_s=*output_s+"\t<query>\n\t\t<id>"+int2str(id)+"</id>\n\t\t<question>"+str_2.substr(0,matches[0].rm_so)+"</question>\n";
							id++;
						}
						if(str_t=="${1}")
						{
							*output_s=*output_s+"\t\t<item1>"+str_2.substr(0,matches[0].rm_so)+"\t\t</item1>\n";
						}
						if(str_t=="${2}")
						{
							*output_s=*output_s+"\t\t<item2>"+str_2.substr(0,matches[0].rm_so)+"\t\t</item2>\n";
						}
						if(str_t=="${3}")
						{
							*output_s=*output_s+"\t\t<item3>"+str_2.substr(0,matches[0].rm_so)+"\t\t</item3>\n";
						}
						if(str_t=="${4}")
						{
							*output_s=*output_s+"\t\t<item4>"+str_2.substr(0,matches[0].rm_so)+"\t\t</item4>\n";
						}
						if(str_t=="${5}")
						{
							*output_s=*output_s+"\t\t<item5>"+str_2.substr(0,matches[0].rm_so)+"\t\t</item5>\n";
						}
						if(str_t=="${6}")
						{
							*output_s=*output_s+"\t\t<item6>"+str_2.substr(0,matches[0].rm_so)+"\t\t</item6>\n";
						}
						if(str_t=="${7}")
						{
							*output_s=*output_s+"\t\t<item7>"+str_2.substr(0,matches[0].rm_so)+"\t\t</item7>\n";
						}
					}
				}
				if(index==index_substring.size())
				{
					ans_b=matches[0].rm_eo;
					ans_str=str_2.substr(matches[0].rm_eo, str_2.length()- matches[0].rm_eo);
				}
					
				it_set=imgs.begin();
				while(it_set!=imgs.end())
				{
					row_img.erase(*it_set);
					it_set++;
				}
				imgs.clear();
				str_p=str_2.substr(0,matches[0].rm_eo);
				str_2=str_2.substr(matches[0].rm_eo, str_2.length()- matches[0].rm_eo);
				str=str_2.c_str();
				row_tag=str_p.find("ENDOFLINE");
				while(row_tag!=-1)
				{
					row_no++;
					row_tag=str_p.find("ENDOFLINE",row_tag+9);
				}
			}
			else
			{
				tag=0;
				break;
			}
		}
		q_no++;
	}
	q_no--;
	
	it_map=row_img.begin();
	if(it_map!=row_img.end())
	{
		row=it_map->first;
		str_t=it_map->second;
		*output_s=*output_s+"\t\t<img>"+ str_t + "</img>\n\t\t\n\t</query>\n";
		it_map++;
	}
	else
	{
		*output_s=*output_s+"\t\t<img>"+"NULL"+"</img>\n\t\t\n\t</query>\n";
	}
	
	//cout<<q_no<<endl;
	*output_s=*output_s+"</doc>\n";
	//cout<<*output_s;
	REa=rewrite(REa);
	h=REa.find("${a}");
	string ans_re1, ans_re2, ans_final;
	ans_re1=REa.substr(0,h);
	ans_re2=REa.substr(h+4,REa.length()-h-4);
	//cout<<ans_re1<<"\t"<<ans_re2<<endl;
	regex=ans_re1.c_str();
	str=ans_str.c_str();
	const char* regex2=ans_re2.c_str();
//	cout<<ans_re1<<endl;
	//cout<<ans_str<<endl;
	int pst1;
	string final_str;
	final_str=*output_s;
	regcomp(&reg, regex, REG_EXTENDED);
	while(regexec(&reg, str, 16, matches, 0) == 0)
	{
		h=matches[0].rm_eo;
		ans_str=ans_str.substr(h, ans_str.length()-h);
		str=ans_str.c_str();
		regcomp(&reg, regex2, REG_EXTENDED);
		if(regexec(&reg, str, 16, matches, 0) == 0)
		{
			ans_final=ans_str.substr(0, matches[0].rm_so);
			pst1=final_str.find("</img>\n\t\t\n\t</query>");
			ans_final="<answer>"+ans_final+"</answer>\n";
			if(pst1!=-1)
			{
				final_str.replace(pst1+9,1, ans_final);
				*output_s=final_str;
			}
			ans_str=ans_str.substr(matches[0].rm_eo,ans_str.length()-matches[0].rm_eo);
			str=ans_str.c_str();
		}
		else
		{
			break;
		}
		//cout<<ans_str<<endl;
	}
	
	regfree (&reg);
	return q_no;
}

int extractor1(string content, set <string> REs, set <string> norms)
{
	int pst1,pst2,pstp;
	string content_clean;
	pst2=0;
	int tag;
	map <int, string> row_img;
	string  img;
	pst1=content.find("<FONT");
	tag=0;
	if(pst1==-1)
	{
		tag=1;
		pst1=0;
	}
	string str;
	content_clean="";
	int row_no;
	row_no=0;
	string sub;
	int h,t;
	typedef pair <int,string> ispair;
	while(pst1!=-1)
	{
		if(tag==0)
			pst2=content.find("</FONT>",pst1);
		else
			pst2=content.find("<br/>",pst1+3);
		pstp=pst1;
		if(pst2!=-1)
		{
			str=content.substr(pst1,pst2-pst1);
			str=remove_meta(str);
			content_clean+=str;
			content_clean+="ENDOFLINE";
		}
		else
			break;
		row_no++;
		if(tag==0)
			pst1=content.find("<FONT",pst2);
		else
			pst1=pst2;
		if(pst1!=-1)
		{
			sub=content.substr(pstp,pst1-pstp);
		}
		else
			sub=content.substr(pstp, content.length()-pstp);
		h=sub.find("<IMG ");
		if(h!=-1)
		{
			t=sub.find("\"",h+10);
			if(t!=-1)
			{
				img=sub.substr(h+10,t-h-10);
			//	cout<<img<<row_no<<endl;
				h=img.rfind("/");
				if(h!=-1)
					img=img.substr(h+1,img.length()-h-1);
				row_img.insert(ispair(row_no, img));
			}
		}
	}
//	cout<<content_clean<<endl;
	int q_no_max, q_no;
	q_no_max=0;
	string REq, REa, output_s, output_s_f;
	set<string>::iterator it;
	
	it=REs.begin();
	output_s_f="NULL";
	while(it!=REs.end())
	{
		str=*it;
		pst1=str.find("###&&###");
		if(pst1!=-1)
		{
			REq=str.substr(0,pst1);
			REa=str.substr(pst1+8, str.length()-pst1-8);
			q_no=REq_find(content_clean, content, REq, REa, &output_s, row_img);
		//	cout<<output_s;
			if(q_no>q_no_max)
			{
				output_s_f=output_s;
				q_no_max=q_no;
			}
				//cout<<REq<<"\n"<<REa<<endl;
		}
		it++;
	}
	output_s_f=norm(output_s_f, norms);
	cout<<output_s_f<<endl;
	return 0;
}