#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <stdlib.h>

char		*ft_strdup(const char *str);

int			main(void)
{
	char	*str = "test";
	char	*out;

	out = ft_strdup(str);
	printf("out: %s\n", out);
	printf("errno: %s\n", strerror(errno));
	free(out);
	return (0);
}
