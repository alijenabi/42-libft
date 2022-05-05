# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alijenabi <alijenabi@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/02 16:57:21 by alijenabi         #+#    #+#              #
#    Updated: 2022/05/05 15:15:41 by alijenabi        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libft.a
CC ?= gcc
CFLAGS ?= -Wall -Werror -Wextra
OBJDIR ?= build/

SRC :=	ft_strlen.c ft_atoi.c ft_isprint.c ft_isalpha.c ft_isdigit.c \
		ft_isalnum.c ft_isascii.c ft_memset.c ft_memmove.c ft_bzero.c \
		ft_memcpy.c ft_strlcpy.c ft_toupper.c ft_tolower.c ft_strchr.c \
		ft_strrchr.c ft_strncmp.c ft_memchr.c ft_strnstr.c ft_calloc.c \
		ft_strdup.c ft_memcmp.c ft_strlcat.c ft_substr.c ft_strjoin.c \
		ft_strtrim.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c\
		ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_split.c

B_SRC :=	ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstadd_back.c\
			ft_lstdelone.c ft_lstclear.c ft_lstlast.c ft_lstiter.c\
			ft_lstmap.c

OBJS = ${SRC:.c=.o}
B_OBJS = ${B_SRC:.c=.o}

OBJECTS_PREF := $(addprefix $(OBJDIR), $(OBJS))
B_OBJECTS_PREF := $(addprefix $(OBJDIR), $(B_OBJS))

all: $(NAME) bonus

$(NAME): $(OBJECTS_PREF)
	@echo "\n"
	@ar rcs $(NAME) $(OBJECTS_PREF)
	
bonus: $(B_OBJECTS_PREF)
	@echo "\n"
	@ar rcs $(NAME) $(B_OBJECTS_PREF)

clean: 
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

$(OBJDIR)%.o : %.c libft.h
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@ -O3

norm: norm_m norm_b

norm_m: 
	@norminette $(SRC)

norm_b: 
	@norminette $(SRC)

.PHONY: all clean fclean re bonus norm
