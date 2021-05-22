//recognize strings under a*, a*b+, abb- //done
#include <stdio.h>

int rule1(char str[], int len){
	int flag =0;
	for (int i = 0; i < len; ++i)
	{
		if (str[i]!='a')
		{
			flag++;
		}
	}
	if (flag)
	{
		return 0;
	}
	return 1;
}

int rule2(char str[], int len){
	int flag =0, count =0;
	while (str[count]=='a'){
		count++;
	}
	for (int i = count; i < len; ++i)
	{
		if (str[i]=='b')
		{
			flag++;
		}
	}
	if (flag==0) return 0;
	else if (count+flag==len)
	{
		return 1;
	}
	return 0;
}

int main() {    

    int len;
    
    printf("Enter the length of the string: \n");
    scanf("%d", &len);
    char str[len];
    printf("Enter the string: \n");
    scanf("%s", str);
    for (int i = 0; i < len; ++i)
    {
    	if (str[i]!='a' && str[i]!='b')
    	{
    		printf("%s doesn't belong to any of the given rules.\n", str);
    		return 0;
    	}
    }
    if (str[0]=='a' && str[1]=='b' && str[2]=='b')
    {
    	printf("%s is accepted under rule 'abb'.\n", str);
    }
    else if(rule1(str, len)){
    	printf("%s is accepted under rule 'a*'.\n", str);
    }
    else if (rule2(str, len))
    {
    	printf("%s is accepted under rule 'a*b+'.\n", str);
    }
    else printf("%s doesn't belong to any of the given rules.\n", str);

    return 0;
}
