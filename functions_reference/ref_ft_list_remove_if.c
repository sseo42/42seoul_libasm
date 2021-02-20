#include "libasm_test.h"

#ifdef LIBASM_TEST_BONUS

void ref_ft_list_remove_if(t_list **begin_list, void *data_ref,
							int (*cmp)(), void (*free_fct)(void *))
{
	t_list *saved_next;

	if (begin_list == NULL || *begin_list == NULL)
		return ;
	if (cmp((*begin_list)->data, data_ref) != 0)
	{
		ref_ft_list_remove_if(&(*begin_list)->next, data_ref, cmp, free_fct);
		return ;
	}
	saved_next = (*begin_list)->next;
	free_fct((*begin_list)->data);
	free(*begin_list);
	*begin_list = saved_next;
	ref_ft_list_remove_if(begin_list, data_ref, cmp, free_fct);
}

#endif
