# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alijenabi <alijenabi@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/02 16:57:21 by alijenabi         #+#    #+#              #
#    Updated: 2022/05/08 21:28:15 by alijenabi        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libft.a
CC ?= gcc
CFLAGS ?= -Wall -Werror -Wextra
OBJDIR ?= build/

MSRC :=	ft_atoi.c					\
		ft_bzero.c					\
		ft_calloc.c					\
		ft_isalnum.c				\
    	ft_isalpha.c				\
		ft_isascii.c				\
		ft_isdigit.c				\
		ft_isprint.c				\
		ft_itoa.c					\
		ft_memchr.c					\
		ft_memcmp.c					\
		ft_memcpy.c					\
		ft_memmove.c				\
		ft_memset.c					\
		ft_putchar_fd.c				\
		ft_putendl_fd.c				\
		ft_putnbr_fd.c				\
		ft_putstr_fd.c				\
		ft_split.c					\
		ft_strchr.c					\
		ft_strdup.c					\
		ft_striteri.c				\
		ft_strjoin.c				\
		ft_strlcat.c				\
		ft_strlcpy.c				\
		ft_strlen.c					\
		ft_strmapi.c				\
		ft_strncmp.c				\
		ft_strnstr.c				\
		ft_strrchr.c				\
		ft_strtrim.c				\
		ft_substr.c					\
		ft_tolower.c				\
		ft_toupper.c

LIST_SRC := ft_lstadd_back.c		\
			ft_lstadd_front.c		\
			ft_lstclear.c			\
			ft_lstdelone.c			\
			ft_lstiter.c			\
			ft_lstlast.c			\
			ft_lstmap.c				\
			ft_lstnew.c				\
			ft_lstsize.c

SRC := $(MSRC) $(LIST_SRC)

OBJS = ${SRC:.c=.o}	

OBJECTS_PREF := $(addprefix $(OBJDIR), $(OBJS))

all: $(NAME)

$(NAME): $(OBJECTS_PREF)
	@echo "\n"
	@ar rcs $(NAME) $(OBJECTS_PREF)

clean: 
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

$(OBJDIR)%.o : %.c libft.h
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@ -O3

norm: norm_h norm_m

norm_h:
	@norminette $(HEADERS)

norm_m: 
	@norminette $(SRC)

.PHONY: all clean fclean re bonus norm
