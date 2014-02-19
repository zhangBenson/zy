#include <string>
#include <fstream>
#include <map>
#include <set>
#include <vector>
#include <cstdlib>
#include <iostream>



using namespace std;

int id=0;

#include "extractor1.h"

string load_file(char* path)
{
	ifstream file(path);
	string content,str;
	if(!file.is_open())
	{
		cerr<<"Failed to open HTML file\n";
		exit(1);
	}
	content="";
	while(getline(file, str))
	{
		content+=str;
		content+=" ";
	}
	file.close();
	return content;
}

int main(int argc, char **argv)
{
	if(argc!=4)
	{
		cout<<"Usage: **.exe [Html File Name] [RE File Name] [Norm File Name]\n";
		return 1;
	}
	set <string> REs, norms;
	string content, str;
	content=load_file(argv[1]);
	
	ifstream RE_file(argv[2]);
	if(!RE_file.is_open())
	{
		cerr<<"Failed to open RE_file\n";
		exit(1);
	}
	
	while(getline(RE_file, str))
	{
		REs.insert(str);
	}
	RE_file.close();
	
	ifstream norm_file(argv[3]);
	if(!norm_file.is_open())
	{
		cerr<<"Failed to open NORM_file\n";
		exit(1);
	}
	
	while(getline(norm_file, str))
	{
		norms.insert(str);
	}
	norm_file.close();
	
	//cout<<content<<endl;
	extractor1(content, REs, norms);
	return 0;
}