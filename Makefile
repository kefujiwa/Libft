# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      # 
#    By: kefujiwa <kefujiwa@student.42tokyo.jp      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/29 23:54:56 by kefujiwa          #+#    #+#              #
#    Updated: 2021/01/20 02:38:42 by kefujiwa         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### MAKEFILE ###

## COLORS ##

# Formats #
_END				= \x1b[0m
_BOLD				= \x1b[1m
_DIM				= \x1b[2m
_UNDER				= \x1b[4m
_BLINK				= \x1b[5m
_REV				= \x1b[7m
_HIDDEN				= \x1b[8m

# Foreground Colors #
_GREY				= \x1b[30m
_RED				= \x1b[31m
_GREEN				= \x1b[32m
_YELLOW				= \x1b[33m
_BLUE				= \x1b[34m
_PURPLE				= \x1b[35m
_CYAN				= \x1b[36m
_WHITE				= \x1b[37m

# Background Colors #
_BGREY				= \x1b[40m
_BRED				= \x1b[41m
_BGREEN				= \x1b[42m
_BYELLOW			= \x1b[43m
_BBLUE				= \x1b[44m
_BPURPLE			= \x1b[45m
_BCYAN				= \x1b[46m
_BWHITE				= \x1b[47m


# **************************************************************************** #

## VARIABLES ##

# Compilation #
CC					= gcc
CFLAGS				= -Wall -Wextra -Werror
AR					= ar rcs

# Delete #
RM					= rm -rf

# Directories #
DIR_HEADERS			= ./includes/
DIR_SRCS			= ./srcs/
DIR_OBJS			= ./compiled_srcs/

# Files #
SRCS				= ft_memset.c \
						ft_memset.c \
						ft_bzero.c \
						ft_memcpy.c \
						ft_memccpy.c \
						ft_memmove.c \
						ft_memchr.c \
						ft_memcmp.c \
						ft_strlen.c \
						ft_strlcpy.c \
						ft_strlcat.c \
						ft_strchr.c \
						ft_strrchr.c \
						ft_strnstr.c \
						ft_strncmp.c \
						ft_atoi.c \
						ft_isalpha.c \
						ft_isdigit.c \
						ft_isalnum.c \
						ft_isascii.c \
						ft_isprint.c \
						ft_toupper.c \
						ft_tolower.c \
						ft_calloc.c \
						ft_strdup.c \
						ft_substr.c \
						ft_strjoin.c \
						ft_strtrim.c \
						ft_split.c \
						ft_itoa.c \
						ft_strmapi.c \
						ft_putchar_fd.c \
						ft_putstr_fd.c \
						ft_putendl_fd.c \
						ft_putnbr_fd.c \
						ft_lstnew.c \
						ft_lstadd_front.c \
						ft_lstsize.c \
						ft_lstlast.c \
						ft_lstadd_back.c \
						ft_lstdelone.c \
						ft_lstclear.c \
						ft_lstiter.c \
						ft_lstmap.c \
						get_next_line.c \

# Compiled Files #
OBJS				= $(SRCS:%.c=$(DIR_OBJS)%.o)
NAME				= libft.a


# **************************************************************************** #

## RULES ##

# Variables Rules #
$(NAME):			$(OBJS)
						@echo "$(_GREEN) All files compiled. $(_END)"
						$(AR) $(NAME) $(OBJS)
						@echo "$(_GREEN) Library '$(NAME)' compiled. $(_END)"

# Compiled Source Files #
$(OBJS):			$(DIR_OBJS)

$(DIR_OBJS)%.o: 	$(DIR_SRCS)%.c
						$(CC) $(CFLAGS) -I $(DIR_HEADERS) -c $< -o $@

$(DIR_OBJS):
						@mkdir $(DIR_OBJS)

# Mandatory Part #
all:				$(NAME)

clean:
						@$(RM) $(DIR_OBJS)
						@$(RM) $(EXEC)
						@echo "$(_YELLOW) '$(DIR_OBJS)' has been deleted. $(_END)"

fclean:				clean
						@$(RM) $(NAME)
						@echo "$(_YELLOW) '$(NAME)' has been deleted. $(_END)"

re:					fclean all

# Bonus Part #
bonus:				all

# Phony #
.PHONY:				all clean fclean re bonus
