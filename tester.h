
#ifndef TESTER_H
# define TESTER_H

# include <stdio.h>
# include <unistd.h>
# include <string.h>
# include <fcntl.h>
# include <stdlib.h>

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

/*
**	MANDATORY PART
*/
size_t		ft_strlen(const char *s);
char		*ft_strcpy(char *dst, const char *src);
int			ft_strcmp(const char *s1, const char *s2);
ssize_t		ft_write(int fd, const void *buf, size_t count);
ssize_t		ft_read(int fd, void *buf, size_t count);
char		*ft_strdup(const char *s1);

/*
**	BONUS PART
*/
int			ft_atoi_base();
void		ft_list_push_front(t_list **begin_list, void *data);
int			ft_list_size(t_list *begin_list);
void		ft_list_sort(t_list **begin_list, int (*cmp)());
void		ft_list_remove_if(t_list **begin_list, void *data_ref, \
		int (*cmp)(), void (*free_fct)(void *));

/*
**	TEST_MANDATORY
*/
void		test_ft_strlen(void);
void		test_ft_strcpy(void);
int			test_mandatory(void);

#endif