# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      # 
#    By: kefujiwa <kefujiwa@student.42tokyo.jp      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/29 23:54:56 by kefujiwa          #+#    #+#              #
#    Updated: 2021/03/13 01:41:38 by kefujiwa         ###   ########.fr        #
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
HEADER_DIR			= ./includes/
SRCS_DIR			= ./srcs/
OBJS_DIR			= ./objs/
MEM_DIR				= ./mem/
CHAR_DIR			= ./char/
STR_DIR				= ./str/
LIST_DIR			= ./list/
GNL_DIR				= ./gnl/

# Files #
MEM					= ft_bzero \
					  ft_memccpy \
					  ft_memchr \
					  ft_memcmp \
					  ft_memcpy \
					  ft_memmove \
					  ft_memset

CHAR				= ft_isalnum \
					  ft_isalpha \
					  ft_isascii \
					  ft_isdigit \
					  ft_isprint \
					  ft_tolower \
					  ft_toupper

STR					= ft_atoi \
					  ft_strchr \
					  ft_strlcat \
					  ft_strlcpy \
					  ft_strlen \
					  ft_strnstr \
					  ft_strncmp \
					  ft_strrchr \
					  ft_calloc \
					  ft_itoa \
					  ft_split \
					  ft_substr \
					  ft_strdup \
					  ft_strjoin \
					  ft_strmapi \
					  ft_strtrim

LIST				= ft_lstadd_back \
					  ft_lstadd_front \
					  ft_lstclear \
					  ft_lstdelone \
					  ft_lstiter \
					  ft_lstlast \
					  ft_lstmap \
					  ft_lstnew \
					  ft_lstsize

GNL					= get_next_line

SRCS				= $(addprefix $(MEM_DIR), $(addsuffix .c, $(MEM))) \
					  $(addprefix $(CHAR_DIR), $(addsuffix .c, $(CHAR))) \
					  $(addprefix $(STR_DIR), $(addsuffix .c, $(STR))) \
					  $(addprefix $(LIST_DIR), $(addsuffix .c, $(LIST))) \
					  $(addprefix $(GNL_DIR), $(addsuffix .c, $(GNL)))

# Compiled Files #
OBJS				= $(SRCS:%.c=$(OBJS_DIR)%.o)
NAME				= libft.a


# **************************************************************************** #

## RULES ##

# Main Rules #
all:				$(NAME)

clean:
						@$(RM) $(OBJS_DIR)
						@echo "$(_RED) '$(OBJS_DIR)' has been deleted. \n$(_END)"

fclean:				clean
						@$(RM) $(NAME)
						@echo "$(_RED) '$(NAME)' has been deleted. \n$(_END)"

re:					fclean all

# Variables Rules #
$(NAME):			$(OBJS)
						@echo "\n"
						@echo "$(_GREEN) Compiling Libft... $(_END)"
						@$(AR) $(NAME) $(OBJS)
						@echo "$(_GREEN)\n Library '$(NAME)' compiled. $(_END)"

# Compiled Source Files #
$(OBJS):			$(OBJS_DIR)

$(OBJS_DIR)%.o: 	$(SRCS_DIR)%.c
						@printf "$(_YELLOW) Generating Libft objects... %s\r" $@
						@$(CC) $(CFLAGS) -I $(HEADER_DIR) -c $< -o $@

$(OBJS_DIR):
						@mkdir -p $(OBJS_DIR)
						@mkdir -p $(OBJS_DIR)$(MEM_DIR)
						@mkdir -p $(OBJS_DIR)$(CHAR_DIR)
						@mkdir -p $(OBJS_DIR)$(STR_DIR)
						@mkdir -p $(OBJS_DIR)$(LIST_DIR)
						@mkdir -p $(OBJS_DIR)$(GNL_DIR)

# Phony #
.PHONY:				all clean fclean re
