# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbento-e <bbento-e@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/11 10:39:02 by bbento-e          #+#    #+#              #
#    Updated: 2022/11/22 10:18:44 by bbento-e         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror
SRC = ft_isalnum.c \
		ft_isalpha.c \
		ft_isdigit.c \
		ft_isprint.c \
		ft_isascii.c \
		ft_strlen.c \
		ft_memset.c \
		ft_bzero.c \
		ft_strlcpy.c \
		ft_strlcat.c \
		ft_toupper.c \
		ft_tolower.c \
		ft_strchr.c \
		ft_strrchr.c \
		ft_atoi.c \
		ft_strncmp.c \
		ft_memcpy.c \
		ft_memchr.c \
		ft_memcmp.c \
		ft_memmove.c \
		ft_strnstr.c \
		ft_calloc.c \
		ft_strdup.c \
		ft_substr.c \
		ft_strjoin.c \
		ft_strtrim.c \
		ft_split.c \
		ft_itoa.c \
		ft_strmapi.c \
		ft_striteri.c \
		ft_putchar_fd.c \
		ft_putstr_fd.c \
		ft_putendl_fd.c \
		ft_putnbr_fd.c \

BONUS = ft_lstnew \
		ft_lstadd_front \
		ft_lstsize \
		ft_lstlast \
		ft_lstadd_back \
		ft_lstdelone \
		ft_lstclear \
		ft_lstiter \
		ft_lstmap \

SRC = ${filter-out ${wildcard *_bonus.c}, ${wildcard *.c}}

OBJ = ${SRC:.c=.o}

BONUS = ${wildcard *_bonus.c}

BONUS_OBJ = ${BONUS:.c=.o}

NAME = libft.a

all: ${NAME}

$(NAME): ${OBJ}
	ar rcs ${NAME} ${OBJ}
	ranlib ${NAME}

clean:
	rm -rf ${OBJ} ${BONUS_OBJ}

fclean: clean
	rm -rf ${NAME}

bonus: ${OBJ} ${BONUS_OBJ}
	ar rcs ${NAME} ${OBJ} ${BONUS_OBJ}
	ranlib ${NAME}

re: fclean all

so:
	$(CC) -nostartfiles -fPIC $(CFLAGS) $(OBJ) $(BONUS_OBJ)
	cc -nostartfiles -shared -o libft.so $(OBJ) $(BONUS_OBJ)
