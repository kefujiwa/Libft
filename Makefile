# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      # 
#    By: kefujiwa <kefujiwa@student.42tokyo.jp      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/29 23:54:56 by kefujiwa          #+#    #+#              #
#    Updated: 2021/03/24 01:18:41 by kefujiwa         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### MAKEFILE ### 
## COLORS ##

# Formats #
_RESET				= \x1b[0m
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
HEADER_DIR			= includes/
SRCS_DIR			= srcs/
OBJS_DIR			= objs/
CHAR_DIR			= char/
GNL_DIR				= gnl/
LIST_DIR			= list/
MEM_DIR				= mem/
PUT_DIR				= put/
STR_DIR				= str/

# Files #
CHAR				= ft_isalnum \
					  ft_isalpha \
					  ft_isascii \
					  ft_isdigit \
					  ft_isprint \
					  ft_tolower \
					  ft_toupper

GNL					= get_next_line

LIST				= ft_lstadd_back \
					  ft_lstadd_front \
					  ft_lstclear \
					  ft_lstdelone \
					  ft_lstiter \
					  ft_lstlast \
					  ft_lstmap \
					  ft_lstnew \
					  ft_lstsize \
					  ft_lstsort

MEM					= ft_bzero \
					  ft_memccpy \
					  ft_memchr \
					  ft_memcmp \
					  ft_memcpy \
					  ft_memmove \
					  ft_memset

PUT					= ft_putchar_fd \
					  ft_putendl_fd \
					  ft_putnbr_fd \
					  ft_putstr_fd

STR					= ft_atoi \
					  ft_strchr \
					  ft_strcmp \
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

SRCS				= $(addprefix $(CHAR_DIR), $(addsuffix .c, $(CHAR))) \
					  $(addprefix $(GNL_DIR), $(addsuffix .c, $(GNL))) \
					  $(addprefix $(LIST_DIR), $(addsuffix .c, $(LIST))) \
					  $(addprefix $(MEM_DIR), $(addsuffix .c, $(MEM))) \
					  $(addprefix $(PUT_DIR), $(addsuffix .c, $(PUT))) \
					  $(addprefix $(STR_DIR), $(addsuffix .c, $(STR)))

# Compiled Files #
OBJS				= $(SRCS:%.c=$(OBJS_DIR)%.o)
NAME				= libft.a


# **************************************************************************** #

## RULES ##

# Main Rules #
all:				$(NAME)

clean:
						@echo "$(_RED)Cleaning libft objects...\n$(_RESET)"
						@$(RM) $(OBJS_DIR)

fclean:				clean
						@echo "$(_RED)Deleting library '$(NAME)'...\n$(_RESET)"
						@$(RM) $(NAME)

re:					fclean all

# Variable Rules #
$(NAME):			$(OBJS)
						@$(AR) $(NAME) $(OBJS)
						@echo "\n\n$(_GREEN)Library '$(NAME)' compiled.\n$(_RESET)"

# Compiled Source Files #
$(OBJS):			$(OBJS_DIR)

$(OBJS_DIR)%.o: 	$(SRCS_DIR)%.c
						@printf "$(_YELLOW)Generating libft objects... %-33.33s\r$(_RESET)" $@
						@$(CC) $(CFLAGS) -I $(HEADER_DIR) -c $< -o $@

$(OBJS_DIR):
						@mkdir -p $(OBJS_DIR)
						@mkdir -p $(OBJS_DIR)$(CHAR_DIR)
						@mkdir -p $(OBJS_DIR)$(GNL_DIR)
						@mkdir -p $(OBJS_DIR)$(LIST_DIR)
						@mkdir -p $(OBJS_DIR)$(MEM_DIR)
						@mkdir -p $(OBJS_DIR)$(PUT_DIR)
						@mkdir -p $(OBJS_DIR)$(STR_DIR)

# Phony #
.PHONY:				all clean fclean re
