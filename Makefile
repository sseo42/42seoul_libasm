NAME = libasm.a

SRCS = ft_strlen.s			\
	   ft_strcpy.s			\
	   ft_strcmp.s			\
	   ft_strdup.s			\
	   ft_write.s			\
	   ft_read.s

NASM = nasm

NASM_FLAGS = -f macho64

OBJS = $(SRCS:.s=.o)

%.o : %.s
	$(NASM) $(NASM_FLAGS) $<

all : $(NAME)

$(NAME) : $(OBJS)
	ar rc $(NAME) $(OBJS)


clean :
	rm -f $(OBJS)

fclean : clean
	rm -f $(NAME)

re : fclean all

bonus : all

.PHONY : clean fclean re bonus
