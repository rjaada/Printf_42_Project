# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rjaada <rjaada@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/13 17:06:46 by rjaada            #+#    #+#              #
#    Updated: 2023/11/16 18:02:05 by rjaada           ###   ########.fr        #
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
