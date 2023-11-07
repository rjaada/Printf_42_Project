# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wolfy <wolfy@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/07 19:26:32 by wolfy             #+#    #+#              #
#    Updated: 2023/11/07 19:55:02 by wolfy            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRC_DIR	=	src/
UTILS_DIR = 	utils/
INC_DIR	=	includes/

INC = -I$(INC_DIR)

CC = gcc
CFLAGS = -Wall -Wextra -Werror $(INC)

SRC =	$(addprefix $(SRC_DIR),	\
		ft_printf.c		\
		ft_handle_char.c	\
		ft_handle_string.c		\
		ft_handle_int.c		\
		ft_handle_unsigned.c		\
		ft_handle_pointer.c	\
		ft_handle_hex.c		\
		ft_handle_percent.c)

UTILS =	$(addprefix $(UTILS_DIR),	\
		ft_strlen.c		\
		ft_putchar.c		\
		ft_putnbr_base.c)

OBJ = $(SRC:.c=.o)

OBJ_UTILS = $(UTILS:.c=.o)

AR = ar rcs

all: $(NAME)

$(NAME): $(OBJ) $(OBJ_UTILS)
	$(AR) $(NAME) $(OBJ) $(OBJ_UTILS)

clean:
	$(RM) $(OBJ) $(OBJ_UTILS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY = all clean fclean re

TEST_SRC = test.c
TEST_OBJ = $(TEST_SRC:.c=.o)
TEST_PROGRAM = test_program

$(TEST_PROGRAM): $(OBJ) $(OBJ_UTILS) $(TEST_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

test: $(TEST_PROGRAM)
	./$(TEST_PROGRAM)