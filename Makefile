NAME = libasm.a

SRCS = ft_strlen.s					\
	   ft_strcpy.s					\
	   ft_strcmp.s					\
	   ft_strdup.s					\
	   ft_write.s					\
	   ft_read.s

SRCS_BONUS = ft_atoi_base_bonus.s			\
			 ft_list_push_front_bonus.s		\
			 ft_list_size_bonus.s			\
			 ft_list_sort_bonus.s			\
			 ft_list_remove_if_bonus.s

NASM = nasm

NASM_FLAGS = -f macho64

OBJS = $(SRCS:.s=.o)

OBJS_BONUS = $(SRCS_BONUS:.s=.o)

%.o : %.s
	@$(NASM) $(NASM_FLAGS) $<

$(NAME) : $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo 'make done!'

all : $(NAME)

clean :
	@rm -f $(OBJS)
	@rm -f $(OBJS_BONUS)
	@echo 'clean up!'

fclean : clean
	@rm -f $(NAME)

re : fclean all

bonus : $(OBJS_BONUS) all
	@ar rcs $(NAME) $(OBJS_BONUS)

.PHONY : all clean fclean re bonus
