#include "tester.h"

void		test_ft_strlen(void)
{
	const char	*test_case1 = "";
	const char	*test_case2 = "a";
	const char	*test_case3 = "ab";
	const char	*test_case4 = "avrw";
	const char	*test_case5 = "watsgsadgasdgsdgsdgsdgsdgaevtasegsevtseatvse";
	const char	*test_case6 = "a634b6334b6w46v36a36v36v3v634vat434ta4vta43vt3v";
	const char	*test_case7 = "rvwa3vrw3\0vawrvw3a";
	const char	*test_case8 = "\t\nsawv5\vavwaw3v";

	printf("ft_strlen\n");
	printf("[case1]\texpect: %zu\tans: %zu\n", strlen(test_case1), ft_strlen(test_case1));
	printf("[case2]\texpect: %zu\tans: %zu\n", strlen(test_case2), ft_strlen(test_case2));
	printf("[case3]\texpect: %zu\tans: %zu\n", strlen(test_case3), ft_strlen(test_case3));
	printf("[case4]\texpect: %zu\tans: %zu\n", strlen(test_case4), ft_strlen(test_case4));
	printf("[case5]\texpect: %zu\tans: %zu\n", strlen(test_case5), ft_strlen(test_case5));
	printf("[case6]\texpect: %zu\tans: %zu\n", strlen(test_case6), ft_strlen(test_case6));
	printf("[case7]\texpect: %zu\tans: %zu\n", strlen(test_case7), ft_strlen(test_case7));
	printf("[case8]\texpect: %zu\tans: %zu\n", strlen(test_case8), ft_strlen(test_case8));
	printf("\n");
}

void		test_ft_strcpy(void)
{
	char		*buf1;
	char		*buf2;
	const char	*test_case1 = "";
	const char	*test_case2 = "a";
	const char	*test_case3 = "ab";
	const char	*test_case4 = "avrw";
	const char	*test_case5 = "watsgsadgasdgsdgsdgsdgsdgaevtasegsevtseatvse";
	const char	*test_case6 = "a634b6334b6w46v36a36v3iasdasdasdawdawewaeawewaeaweaweawdawwdasgadrgadfgdfbdafavddf6v3v634vat434ta4vta43vt3v";
	const char	*test_case7 = "rvwa3vrw3\0vawrvw3a";
	const char	*test_case8 = "\t\nsawv5\vavwaw3v";
	const char	*box[8];

	box[0] = test_case1;
	box[1] = test_case2;
	box[2] = test_case3;
	box[3] = test_case4;
	box[4] = test_case5;
	box[5] = test_case6;
	box[6] = test_case7;
	box[7] = test_case8;

	printf("ft_strcpy\n");
	for (int i = 0; i < 8; i++)
	{
		buf1 = (char *)malloc(sizeof(char) * 100);
		buf2 = (char *)malloc(sizeof(char) * 100);

		printf("[case%d]\nexpect: %s\nans:    %s\n\n", i, \
				strcpy(buf1, box[i]), ft_strcpy(buf2, box[i]));
		free(buf1);
		free(buf2);
	}

}

int			test_mandatory(void)
{
	test_ft_strlen();
	test_ft_strcpy();
	return (0);
}
